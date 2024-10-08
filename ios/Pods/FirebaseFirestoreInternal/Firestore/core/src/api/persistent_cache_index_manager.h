/*
 * Copyright 2023 Google LLC
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

#ifndef FIRESTORE_CORE_SRC_API_PERSISTENT_CACHE_INDEX_MANAGER_H_
#define FIRESTORE_CORE_SRC_API_PERSISTENT_CACHE_INDEX_MANAGER_H_

#include <memory>

namespace firebase {
namespace firestore {

namespace core {
class FirestoreClient;
}  // namespace core

namespace api {

/**
 * A PersistentCacheIndexManager which you can config persistent cache indexes
 * used for local query execution.
 *
 * To use, call Firestore::persistent_cache_index_manager() to get an instance.
 */
class PersistentCacheIndexManager {
 public:
  explicit PersistentCacheIndexManager(
      std::shared_ptr<core::FirestoreClient> client);

  /**
   * Enables SDK to create persistent cache indexes automatically for local
   * query execution when SDK believes cache indexes can help improves
   * performance.
   *
   * This feature is disabled by default.
   */
  void EnableIndexAutoCreation() const;

  /**
   * Stops creating persistent cache indexes automatically for local query
   * execution. The indexes which have been created by calling
   * EnableIndexAutoCreation() still take effect.
   */
  void DisableIndexAutoCreation() const;

  /**
   * Removes all persistent cache indexes. Please note this function will also
   * deletes indexes generated by Firestore.SetIndexConfiguration(...), which
   * are deprecated.
   */
  void DeleteAllFieldIndexes() const;

 private:
  const std::shared_ptr<core::FirestoreClient> client_;
};

}  // namespace api
}  // namespace firestore
}  // namespace firebase

#endif  // FIRESTORE_CORE_SRC_API_PERSISTENT_CACHE_INDEX_MANAGER_H_
