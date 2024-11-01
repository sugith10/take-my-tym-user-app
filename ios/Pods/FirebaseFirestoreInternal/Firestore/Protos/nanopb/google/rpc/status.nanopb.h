/*
 * Copyright 2024 Google LLC
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

/* Automatically generated nanopb header */
/* Generated by nanopb-0.3.9.8 */

#ifndef PB_GOOGLE_RPC_STATUS_NANOPB_H_INCLUDED
#define PB_GOOGLE_RPC_STATUS_NANOPB_H_INCLUDED
#include <pb.h>

#include "google/protobuf/any.nanopb.h"

#include <string>

namespace firebase {
namespace firestore {

/* @@protoc_insertion_point(includes) */
#if PB_PROTO_HEADER_VERSION != 30
#error Regenerate this file with the current version of nanopb generator.
#endif


/* Struct definitions */
typedef struct _google_rpc_Status {
    int32_t code;
    pb_bytes_array_t *message;
    pb_size_t details_count;
    struct _google_protobuf_Any *details;

    std::string ToString(int indent = 0) const;
/* @@protoc_insertion_point(struct:google_rpc_Status) */
} google_rpc_Status;

/* Default values for struct fields */

/* Initializer values for message structs */
#define google_rpc_Status_init_default           {0, NULL, 0, NULL}
#define google_rpc_Status_init_zero              {0, NULL, 0, NULL}

/* Field tags (for use in manual encoding/decoding) */
#define google_rpc_Status_code_tag               1
#define google_rpc_Status_message_tag            2
#define google_rpc_Status_details_tag            3

/* Struct field encoding specification for nanopb */
extern const pb_field_t google_rpc_Status_fields[4];

/* Maximum encoded size of messages (where known) */
/* google_rpc_Status_size depends on runtime parameters */

/* Message IDs (where set with "msgid" option) */
#ifdef PB_MSGID

#define STATUS_MESSAGES \


#endif

}  // namespace firestore
}  // namespace firebase

/* @@protoc_insertion_point(eof) */

#endif
