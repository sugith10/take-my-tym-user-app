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

#ifndef FIRESTORE_CORE_SRC_MODEL_SET_MUTATION_H_
#define FIRESTORE_CORE_SRC_MODEL_SET_MUTATION_H_

#include <memory>
#include <string>
#include <utility>
#include <vector>

#include "Firestore/core/src/model/mutation.h"
#include "Firestore/core/src/model/object_value.h"
#include "absl/types/optional.h"

namespace firebase {
namespace firestore {
namespace model {

/**
 * A mutation that creates or replaces the document at the given key with the
 * object value contents.
 */
class SetMutation : public Mutation {
 public:
  SetMutation(DocumentKey key, ObjectValue value, Precondition precondition);

  SetMutation(DocumentKey key,
              ObjectValue value,
              Precondition precondition,
              std::vector<FieldTransform> field_transforms);

  /**
   * Casts a Mutation to a SetMutation. This is a checked operation that will
   * assert if the type of the Mutation isn't actually Type::Set.
   */
  explicit SetMutation(const Mutation& mutation);

  /** Creates an invalid SetMutation instance. */
  SetMutation() = default;

  /** Returns the object value to use when setting the document. */
  const ObjectValue& value() const {
    return set_rep().value();
  }

 private:
  class Rep : public Mutation::Rep {
   public:
    Rep(DocumentKey&& key,
        ObjectValue&& value,
        Precondition&& precondition,
        std::vector<FieldTransform>&& field_transforms);

    Type type() const override {
      return Type::Set;
    }

    const ObjectValue& value() const {
      return value_;
    }

    void ApplyToRemoteDocument(
        MutableDocument& document,
        const MutationResult& mutation_result) const override;

    absl::optional<FieldMask> ApplyToLocalView(
        MutableDocument& document,
        absl::optional<FieldMask> previous_mask,
        const Timestamp& local_write_time) const override;

    bool Equals(const Mutation::Rep& other) const override;

    size_t Hash() const override;

    std::string ToString() const override;

   private:
    ObjectValue value_;
  };

  const Rep& set_rep() const {
    return static_cast<const Rep&>(rep());
  }
};

}  // namespace model
}  // namespace firestore
}  // namespace firebase

#endif  // FIRESTORE_CORE_SRC_MODEL_SET_MUTATION_H_
