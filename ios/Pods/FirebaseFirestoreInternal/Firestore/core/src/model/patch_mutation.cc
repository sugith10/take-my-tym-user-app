/*
 * Copyright 2019 Google
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

#include "Firestore/core/src/model/patch_mutation.h"

#include <cstdlib>
#include <set>
#include <utility>

#include "Firestore/core/src/model/field_path.h"
#include "Firestore/core/src/model/mutable_document.h"
#include "Firestore/core/src/util/hard_assert.h"
#include "Firestore/core/src/util/to_string.h"

namespace firebase {
namespace firestore {
namespace model {

using nanopb::Message;

static_assert(
    sizeof(Mutation) == sizeof(PatchMutation),
    "PatchMutation may not have additional members (everything goes in Rep)");

PatchMutation::PatchMutation(DocumentKey key,
                             ObjectValue value,
                             FieldMask mask,
                             Precondition precondition,
                             std::vector<FieldTransform> field_transforms)
    : Mutation(std::make_shared<Rep>(std::move(key),
                                     std::move(value),
                                     std::move(mask),
                                     std::move(precondition),
                                     std::move(field_transforms))) {
}

PatchMutation::PatchMutation(const Mutation& mutation) : Mutation(mutation) {
  HARD_ASSERT(type() == Type::Patch);
}

PatchMutation::PatchMutation(DocumentKey key,
                             ObjectValue value,
                             FieldMask mask,
                             Precondition precondition)
    : Mutation(std::make_shared<Rep>(std::move(key),
                                     std::move(value),
                                     std::move(mask),
                                     std::move(precondition),
                                     std::vector<FieldTransform>())) {
}

PatchMutation::Rep::Rep(DocumentKey&& key,
                        ObjectValue&& value,
                        FieldMask&& mask,
                        Precondition&& precondition,
                        std::vector<FieldTransform>&& field_transforms)
    : Mutation::Rep(std::move(key),
                    std::move(precondition),
                    std::move(field_transforms),
                    std::move(mask)),
      value_(std::move(value)) {
}

void PatchMutation::Rep::ApplyToRemoteDocument(
    MutableDocument& document, const MutationResult& mutation_result) const {
  VerifyKeyMatches(document);

  if (!precondition().IsValidFor(document)) {
    // Since the mutation was not rejected, we know that the precondition
    // matched on the backend. We therefore must not have the expected version
    // of the document in our cache and return an UnknownDocument with the known
    // update_time.
    document.ConvertToUnknownDocument(mutation_result.version());
    return;
  }

  ObjectValue& data = document.data();
  auto transform_results =
      ServerTransformResults(data, mutation_result.transform_results());
  data.SetAll(GetPatch());
  data.SetAll(std::move(transform_results));
  document.ConvertToFoundDocument(mutation_result.version())
      .SetHasCommittedMutations();
}

absl::optional<FieldMask> PatchMutation::Rep::ApplyToLocalView(
    MutableDocument& document,
    absl::optional<FieldMask> previous_mask,
    const Timestamp& local_write_time) const {
  VerifyKeyMatches(document);

  if (!precondition().IsValidFor(document)) {
    return previous_mask;
  }

  ObjectValue& data = document.data();
  auto transform_results = LocalTransformResults(data, local_write_time);
  data.SetAll(GetPatch());
  data.SetAll(std::move(transform_results));
  document.ConvertToFoundDocument(document.version()).SetHasLocalMutations();

  if (!previous_mask.has_value()) {
    return absl::nullopt;
  }

  std::set<FieldPath> merged_set(previous_mask.value().begin(),
                                 previous_mask.value().end());
  merged_set.insert(field_mask().value().begin(), field_mask().value().end());
  std::vector<FieldPath> transformed;
  for (const auto& transform : this->field_transforms()) {
    merged_set.insert(transform.path());
  }
  return FieldMask{merged_set};
}

TransformMap PatchMutation::Rep::GetPatch() const {
  TransformMap result;
  for (const FieldPath& path : field_mask().value()) {
    if (!path.empty()) {
      auto value = value_.Get(path);
      if (value) {
        result[path] = DeepClone(*value);
      } else {
        result[path] = absl::nullopt;
      }
    }
  }
  return result;
}

bool PatchMutation::Rep::Equals(const Mutation::Rep& other) const {
  if (!Mutation::Rep::Equals(other)) return false;

  const auto& other_rep = static_cast<const PatchMutation::Rep&>(other);
  return value_ == other_rep.value_ && field_mask() == other_rep.field_mask();
}

size_t PatchMutation::Rep::Hash() const {
  return util::Hash(Mutation::Rep::Hash(), field_mask(), value_);
}

std::string PatchMutation::Rep::ToString() const {
  return absl::StrCat("PatchMutation(key=", key().ToString(),
                      ", precondition=", precondition().ToString(),
                      ", value=", value().ToString(),
                      ", mask=", field_mask().value().ToString(),
                      ", transforms=", util::ToString(field_transforms()), ")");
}

}  // namespace model
}  // namespace firestore
}  // namespace firebase
