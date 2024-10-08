/* This file was generated by upb_generator from the input file:
 *
 *     google/protobuf/any.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef GOOGLE_PROTOBUF_ANY_PROTO_UPB_H_
#define GOOGLE_PROTOBUF_ANY_PROTO_UPB_H_

#include "upb/generated_code_support.h"

#include "google/protobuf/any.upb_minitable.h"

// Must be last.
#include "upb/port/def.inc"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct google_protobuf_Any google_protobuf_Any;



/* google.protobuf.Any */

UPB_INLINE google_protobuf_Any* google_protobuf_Any_new(upb_Arena* arena) {
  return (google_protobuf_Any*)_upb_Message_New(&google__protobuf__Any_msg_init, arena);
}
UPB_INLINE google_protobuf_Any* google_protobuf_Any_parse(const char* buf, size_t size, upb_Arena* arena) {
  google_protobuf_Any* ret = google_protobuf_Any_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &google__protobuf__Any_msg_init, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE google_protobuf_Any* google_protobuf_Any_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  google_protobuf_Any* ret = google_protobuf_Any_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &google__protobuf__Any_msg_init, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* google_protobuf_Any_serialize(const google_protobuf_Any* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &google__protobuf__Any_msg_init, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* google_protobuf_Any_serialize_ex(const google_protobuf_Any* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &google__protobuf__Any_msg_init, options, arena, &ptr, len);
  return ptr;
}
UPB_INLINE void google_protobuf_Any_clear_type_url(google_protobuf_Any* msg) {
  const upb_MiniTableField field = {1, 0, 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE upb_StringView google_protobuf_Any_type_url(const google_protobuf_Any* msg) {
  upb_StringView default_val = upb_StringView_FromString("");
  upb_StringView ret;
  const upb_MiniTableField field = {1, 0, 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}
UPB_INLINE void google_protobuf_Any_clear_value(google_protobuf_Any* msg) {
  const upb_MiniTableField field = {2, UPB_SIZE(8, 16), 0, kUpb_NoSub, 12, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE upb_StringView google_protobuf_Any_value(const google_protobuf_Any* msg) {
  upb_StringView default_val = upb_StringView_FromString("");
  upb_StringView ret;
  const upb_MiniTableField field = {2, UPB_SIZE(8, 16), 0, kUpb_NoSub, 12, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}

UPB_INLINE void google_protobuf_Any_set_type_url(google_protobuf_Any *msg, upb_StringView value) {
  const upb_MiniTableField field = {1, 0, 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}
UPB_INLINE void google_protobuf_Any_set_value(google_protobuf_Any *msg, upb_StringView value) {
  const upb_MiniTableField field = {2, UPB_SIZE(8, 16), 0, kUpb_NoSub, 12, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port/undef.inc"

#endif  /* GOOGLE_PROTOBUF_ANY_PROTO_UPB_H_ */
