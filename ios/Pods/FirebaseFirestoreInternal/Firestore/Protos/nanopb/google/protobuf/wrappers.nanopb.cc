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

/* Automatically generated nanopb constant definitions */
/* Generated by nanopb-0.3.9.8 */

#include "wrappers.nanopb.h"

#include "Firestore/core/src/nanopb/pretty_printing.h"

namespace firebase {
namespace firestore {

using nanopb::PrintEnumField;
using nanopb::PrintHeader;
using nanopb::PrintMessageField;
using nanopb::PrintPrimitiveField;
using nanopb::PrintTail;

/* @@protoc_insertion_point(includes) */
#if PB_PROTO_HEADER_VERSION != 30
#error Regenerate this file with the current version of nanopb generator.
#endif



const pb_field_t google_protobuf_DoubleValue_fields[2] = {
    PB_FIELD(  1, DOUBLE  , SINGULAR, STATIC  , FIRST, google_protobuf_DoubleValue, value, value, 0),
    PB_LAST_FIELD
};

const pb_field_t google_protobuf_FloatValue_fields[2] = {
    PB_FIELD(  1, FLOAT   , SINGULAR, STATIC  , FIRST, google_protobuf_FloatValue, value, value, 0),
    PB_LAST_FIELD
};

const pb_field_t google_protobuf_Int64Value_fields[2] = {
    PB_FIELD(  1, INT64   , SINGULAR, STATIC  , FIRST, google_protobuf_Int64Value, value, value, 0),
    PB_LAST_FIELD
};

const pb_field_t google_protobuf_UInt64Value_fields[2] = {
    PB_FIELD(  1, UINT64  , SINGULAR, STATIC  , FIRST, google_protobuf_UInt64Value, value, value, 0),
    PB_LAST_FIELD
};

const pb_field_t google_protobuf_Int32Value_fields[2] = {
    PB_FIELD(  1, INT32   , SINGULAR, STATIC  , FIRST, google_protobuf_Int32Value, value, value, 0),
    PB_LAST_FIELD
};

const pb_field_t google_protobuf_UInt32Value_fields[2] = {
    PB_FIELD(  1, UINT32  , SINGULAR, STATIC  , FIRST, google_protobuf_UInt32Value, value, value, 0),
    PB_LAST_FIELD
};

const pb_field_t google_protobuf_BoolValue_fields[2] = {
    PB_FIELD(  1, BOOL    , SINGULAR, STATIC  , FIRST, google_protobuf_BoolValue, value, value, 0),
    PB_LAST_FIELD
};

const pb_field_t google_protobuf_StringValue_fields[2] = {
    PB_FIELD(  1, BYTES   , SINGULAR, POINTER , FIRST, google_protobuf_StringValue, value, value, 0),
    PB_LAST_FIELD
};

const pb_field_t google_protobuf_BytesValue_fields[2] = {
    PB_FIELD(  1, BYTES   , SINGULAR, POINTER , FIRST, google_protobuf_BytesValue, value, value, 0),
    PB_LAST_FIELD
};


/* On some platforms (such as AVR), double is really float.
 * These are not directly supported by nanopb, but see example_avr_double.
 * To get rid of this error, remove any double fields from your .proto.
 */
PB_STATIC_ASSERT(sizeof(double) == 8, DOUBLE_MUST_BE_8_BYTES)

std::string google_protobuf_DoubleValue::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "DoubleValue", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("value: ",
        value, indent + 1, false);

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

std::string google_protobuf_FloatValue::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "FloatValue", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("value: ",
        value, indent + 1, false);

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

std::string google_protobuf_Int64Value::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "Int64Value", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("value: ",
        value, indent + 1, false);

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

std::string google_protobuf_UInt64Value::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "UInt64Value", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("value: ",
        value, indent + 1, false);

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

std::string google_protobuf_Int32Value::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "Int32Value", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("value: ",
        value, indent + 1, false);

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

std::string google_protobuf_UInt32Value::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "UInt32Value", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("value: ",
        value, indent + 1, false);

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

std::string google_protobuf_BoolValue::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "BoolValue", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("value: ",
        value, indent + 1, false);

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

std::string google_protobuf_StringValue::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "StringValue", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("value: ",
        value, indent + 1, false);

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

std::string google_protobuf_BytesValue::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "BytesValue", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("value: ",
        value, indent + 1, false);

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

}  // namespace firestore
}  // namespace firebase

/* @@protoc_insertion_point(eof) */
