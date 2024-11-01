/*
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "Firestore/core/src/api/firestore.h"

#include <utility>
#include <vector>

#include "Firestore/core/src/api/collection_reference.h"
#include "Firestore/core/src/api/document_reference.h"
#include "Firestore/core/src/api/listener_registration.h"
#include "Firestore/core/src/api/persistent_cache_index_manager.h"
#include "Firestore/core/src/api/settings.h"
#include "Firestore/core/src/api/snapshots_in_sync_listener_registration.h"
#include "Firestore/core/src/api/write_batch.h"
#include "Firestore/core/src/core/event_listener.h"
#include "Firestore/core/src/core/firestore_client.h"
#include "Firestore/core/src/core/query.h"
#include "Firestore/core/src/core/transaction.h"
#include "Firestore/core/src/credentials/empty_credentials_provider.h"
#include "Firestore/core/src/local/leveldb_persistence.h"
#include "Firestore/core/src/model/document_key.h"
#include "Firestore/core/src/model/field_path.h"
#include "Firestore/core/src/model/resource_path.h"
#include "Firestore/core/src/remote/firebase_metadata_provider.h"
#include "Firestore/core/src/remote/grpc_connection.h"
#include "Firestore/core/src/util/async_queue.h"
#include "Firestore/core/src/util/exception.h"
#include "Firestore/core/src/util/executor.h"
#include "Firestore/core/src/util/hard_assert.h"
#include "Firestore/core/src/util/json_reader.h"
#include "Firestore/core/src/util/log.h"
#include "Firestore/core/src/util/status.h"
#include "Firestore/third_party/nlohmann_json/json.hpp"
#include "absl/memory/memory.h"

namespace firebase {
namespace firestore {
namespace api {

using core::AsyncEventListener;
using core::DatabaseInfo;
using core::FirestoreClient;
using credentials::AuthCredentialsProvider;
using local::LevelDbPersistence;
using model::FieldIndex;
using model::FieldPath;
using model::ResourcePath;
using model::Segment;
using nlohmann::json;
using remote::FirebaseMetadataProvider;
using remote::GrpcConnection;
using util::AsyncQueue;
using util::Empty;
using util::Executor;
using util::Status;
using util::ThrowInvalidArgument;

const int kDefaultTransactionMaxAttempts = 5;

Firestore::Firestore(
    model::DatabaseId database_id,
    std::string persistence_key,
    std::shared_ptr<credentials::AuthCredentialsProvider>
        auth_credentials_provider,
    std::shared_ptr<credentials::AppCheckCredentialsProvider>
        app_check_credentials_provider,
    std::shared_ptr<AsyncQueue> worker_queue,
    std::unique_ptr<FirebaseMetadataProvider> firebase_metadata_provider,
    void* extension)
    : database_id_{std::move(database_id)},
      app_check_credentials_provider_{
          std::move(app_check_credentials_provider)},
      auth_credentials_provider_{std::move(auth_credentials_provider)},
      persistence_key_{std::move(persistence_key)},
      worker_queue_{std::move(worker_queue)},
      firebase_metadata_provider_{std::move(firebase_metadata_provider)},
      extension_{extension} {
}

Firestore::~Firestore() {
  Dispose();
}

void Firestore::Dispose() {
  std::lock_guard<std::mutex> lock(mutex_);

  // If the client hasn't been configured yet we don't need to create it just
  // to tear it down.
  if (!client_) return;

  client_->Dispose();
}

const std::shared_ptr<FirestoreClient>& Firestore::client() {
  HARD_ASSERT(client_, "Client is not yet configured.");
  return client_;
}

const std::shared_ptr<AsyncQueue>& Firestore::worker_queue() {
  return worker_queue_;
}

const Settings& Firestore::settings() const {
  std::lock_guard<std::mutex> lock{mutex_};
  return settings_;
}

void Firestore::set_settings(const Settings& settings) {
  std::lock_guard<std::mutex> lock{mutex_};
  if (client_) {
    util::ThrowIllegalState(
        "Firestore instance has already been started and its settings can "
        "no longer be changed. You can only set settings before calling any "
        "other methods on a Firestore instance.");
  }
  if (!settings.ssl_enabled() && settings.host() == Settings::DefaultHost) {
    util::ThrowIllegalState(
        "You can't set the 'sslEnabled' setting to false unless you also set a "
        "non-default 'host'.");
  }

  settings_ = settings;
}

void Firestore::set_user_executor(std::unique_ptr<Executor> user_executor) {
  std::lock_guard<std::mutex> lock{mutex_};
  HARD_ASSERT(!client_ && user_executor,
              "set_user_executor() must be called with a valid executor, "
              "before the client is initialized.");
  user_executor_ = std::move(user_executor);
}

CollectionReference Firestore::GetCollection(
    const std::string& collection_path) {
  EnsureClientConfigured();
  ResourcePath path = ResourcePath::FromString(collection_path);
  return CollectionReference{std::move(path), shared_from_this()};
}

DocumentReference Firestore::GetDocument(const std::string& document_path) {
  EnsureClientConfigured();
  return DocumentReference{ResourcePath::FromString(document_path),
                           shared_from_this()};
}

WriteBatch Firestore::GetBatch() {
  EnsureClientConfigured();
  return WriteBatch(shared_from_this());
}

core::Query Firestore::GetCollectionGroup(std::string collection_id) {
  EnsureClientConfigured();

  return core::Query(ResourcePath::Empty(), std::make_shared<const std::string>(
                                                std::move(collection_id)));
}

void Firestore::RunTransaction(core::TransactionUpdateCallback update_callback,
                               core::TransactionResultCallback result_callback,
                               int max_attempts) {
  HARD_ASSERT(max_attempts >= 0, "invalid max_attempts: %s", max_attempts);
  EnsureClientConfigured();

  client_->Transaction(max_attempts, std::move(update_callback),
                       std::move(result_callback));
}

void Firestore::Terminate(util::StatusCallback callback) {
  // The client must be initialized to ensure that all subsequent API usage
  // throws an exception.
  EnsureClientConfigured();
  client_->TerminateAsync(std::move(callback));
}

void Firestore::WaitForPendingWrites(util::StatusCallback callback) {
  EnsureClientConfigured();
  client_->WaitForPendingWrites(std::move(callback));
}

void Firestore::ClearPersistence(util::StatusCallback callback) {
  worker_queue()->EnqueueEvenWhileRestricted([this, callback] {
    auto MaybeCallback = [=](Status status) {
      if (callback) {
        user_executor_->Execute([=] { callback(status); });
      }
    };

    {
      std::lock_guard<std::mutex> lock{mutex_};
      if (client_ && !client_->is_terminated()) {
        MaybeCallback(util::Status(
            Error::kErrorFailedPrecondition,
            "Persistence cannot be cleared while the client is running."));
        return;
      }
    }

    MaybeCallback(LevelDbPersistence::ClearPersistence(MakeDatabaseInfo()));
  });
}

void Firestore::EnableNetwork(util::StatusCallback callback) {
  EnsureClientConfigured();
  client_->EnableNetwork(std::move(callback));
}

void Firestore::DisableNetwork(util::StatusCallback callback) {
  EnsureClientConfigured();
  client_->DisableNetwork(std::move(callback));
}

void Firestore::SetClientLanguage(std::string language_token) {
  GrpcConnection::SetClientLanguage(std::move(language_token));
}

std::unique_ptr<ListenerRegistration> Firestore::AddSnapshotsInSyncListener(
    std::unique_ptr<core::EventListener<Empty>> listener) {
  EnsureClientConfigured();
  auto async_listener = AsyncEventListener<Empty>::Create(
      client_->user_executor(), std::move(listener));
  client_->AddSnapshotsInSyncListener(async_listener);
  return absl::make_unique<SnapshotsInSyncListenerRegistration>(
      client_, std::move(async_listener));
}

void Firestore::EnsureClientConfigured() {
  std::lock_guard<std::mutex> lock{mutex_};

  if (!client_) {
    HARD_ASSERT(worker_queue_, "Expected non-null worker queue");
    client_ = FirestoreClient::Create(
        MakeDatabaseInfo(), settings_, std::move(auth_credentials_provider_),
        std::move(app_check_credentials_provider_), user_executor_,
        worker_queue_, std::move(firebase_metadata_provider_));
  }
}

DatabaseInfo Firestore::MakeDatabaseInfo() const {
  return DatabaseInfo(database_id_, persistence_key_, settings_.host(),
                      settings_.ssl_enabled());
}

void Firestore::SetIndexConfiguration(const std::string& config,
                                      const util::StatusCallback& callback) {
  EnsureClientConfigured();

  util::JsonReader reader;
  if (!settings_.persistence_enabled()) {
    LOG_DEBUG("Cannot enable indexes when persistence is disabled.");
    callback(util::Status::OK());
    return;
  }

  auto json_object =
      nlohmann::json::parse(config.begin(), config.end(),
                            /*callback=*/nullptr, /*allow_exceptions=*/false);
  if (json_object.is_discarded()) {
    callback(Status(Error::kErrorInvalidArgument, "Invalid Json format."));
    return;
  }

  std::vector<FieldIndex> parsed_indexes;
  const std::vector<json> default_vector;
  const auto& json_indexes =
      reader.OptionalArray("indexes", json_object, default_vector);
  for (const auto& json_index : json_indexes) {
    const std::string& collection_group =
        reader.RequiredString("collectionGroup", json_index);
    std::vector<Segment> segments;
    const auto& json_fields =
        reader.OptionalArray("fields", json_index, default_vector);
    for (const auto& json_field : json_fields) {
      FieldPath field_path = FieldPath::FromServerFormat(
                                 reader.RequiredString("fieldPath", json_field))
                                 .ValueOrDie();
      std::string default_string;
      if ("CONTAINS" ==
          reader.OptionalString("arrayConfig", json_field, default_string)) {
        segments.emplace_back(
            Segment(std::move(field_path), Segment::Kind::kContains));
      } else if ("ASCENDING" ==
                 reader.OptionalString("order", json_field, default_string)) {
        segments.emplace_back(
            Segment(std::move(field_path), Segment::Kind::kAscending));
      } else {
        segments.emplace_back(
            Segment(std::move(field_path), Segment::Kind::kDescending));
      }
    }

    if (reader.status() != util::Status::OK()) {
      callback(reader.status());
      return;
    }

    parsed_indexes.emplace_back(
        FieldIndex(FieldIndex::UnknownId(), collection_group,
                   std::move(segments), FieldIndex::InitialState()));
  }

  client_->ConfigureFieldIndexes(std::move(parsed_indexes));

  callback(util::Status::OK());
  return;
}

std::shared_ptr<const PersistentCacheIndexManager>
Firestore::persistent_cache_index_manager() {
  EnsureClientConfigured();
  if (!persistent_cache_index_manager_ && settings_.persistence_enabled()) {
    persistent_cache_index_manager_ =
        std::make_shared<const PersistentCacheIndexManager>(client_);
  }

  return persistent_cache_index_manager_;
}

std::shared_ptr<LoadBundleTask> Firestore::LoadBundle(
    std::unique_ptr<util::ByteStream> bundle_data) {
  EnsureClientConfigured();

  auto task = std::make_shared<LoadBundleTask>(user_executor_);
  client_->LoadBundle(std::move(bundle_data), task);

  return task;
}

void Firestore::GetNamedQuery(const std::string& name,
                              api::QueryCallback callback) {
  EnsureClientConfigured();
  client_->GetNamedQuery(name, std::move(callback));
}

}  // namespace api
}  // namespace firestore
}  // namespace firebase
