/* This file was generated by upb_generator from the input file:
 *
 *     envoy/type/v3/semantic_version.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef ENVOY_TYPE_V3_SEMANTIC_VERSION_PROTO_UPB_H_
#define ENVOY_TYPE_V3_SEMANTIC_VERSION_PROTO_UPB_H_

#include "upb/generated_code_support.h"

#include "envoy/type/v3/semantic_version.upb_minitable.h"

#include "udpa/annotations/status.upb_minitable.h"
#include "udpa/annotations/versioning.upb_minitable.h"

// Must be last.
#include "upb/port/def.inc"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct envoy_type_v3_SemanticVersion envoy_type_v3_SemanticVersion;



/* envoy.type.v3.SemanticVersion */

UPB_INLINE envoy_type_v3_SemanticVersion* envoy_type_v3_SemanticVersion_new(upb_Arena* arena) {
  return (envoy_type_v3_SemanticVersion*)_upb_Message_New(&envoy__type__v3__SemanticVersion_msg_init, arena);
}
UPB_INLINE envoy_type_v3_SemanticVersion* envoy_type_v3_SemanticVersion_parse(const char* buf, size_t size, upb_Arena* arena) {
  envoy_type_v3_SemanticVersion* ret = envoy_type_v3_SemanticVersion_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy__type__v3__SemanticVersion_msg_init, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE envoy_type_v3_SemanticVersion* envoy_type_v3_SemanticVersion_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  envoy_type_v3_SemanticVersion* ret = envoy_type_v3_SemanticVersion_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy__type__v3__SemanticVersion_msg_init, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* envoy_type_v3_SemanticVersion_serialize(const envoy_type_v3_SemanticVersion* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy__type__v3__SemanticVersion_msg_init, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* envoy_type_v3_SemanticVersion_serialize_ex(const envoy_type_v3_SemanticVersion* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy__type__v3__SemanticVersion_msg_init, options, arena, &ptr, len);
  return ptr;
}
UPB_INLINE void envoy_type_v3_SemanticVersion_clear_major_number(envoy_type_v3_SemanticVersion* msg) {
  const upb_MiniTableField field = {1, 0, 0, kUpb_NoSub, 13, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE uint32_t envoy_type_v3_SemanticVersion_major_number(const envoy_type_v3_SemanticVersion* msg) {
  uint32_t default_val = (uint32_t)0u;
  uint32_t ret;
  const upb_MiniTableField field = {1, 0, 0, kUpb_NoSub, 13, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}
UPB_INLINE void envoy_type_v3_SemanticVersion_clear_minor_number(envoy_type_v3_SemanticVersion* msg) {
  const upb_MiniTableField field = {2, 4, 0, kUpb_NoSub, 13, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE uint32_t envoy_type_v3_SemanticVersion_minor_number(const envoy_type_v3_SemanticVersion* msg) {
  uint32_t default_val = (uint32_t)0u;
  uint32_t ret;
  const upb_MiniTableField field = {2, 4, 0, kUpb_NoSub, 13, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}
UPB_INLINE void envoy_type_v3_SemanticVersion_clear_patch(envoy_type_v3_SemanticVersion* msg) {
  const upb_MiniTableField field = {3, 8, 0, kUpb_NoSub, 13, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)};
  _upb_Message_ClearNonExtensionField(msg, &field);
}
UPB_INLINE uint32_t envoy_type_v3_SemanticVersion_patch(const envoy_type_v3_SemanticVersion* msg) {
  uint32_t default_val = (uint32_t)0u;
  uint32_t ret;
  const upb_MiniTableField field = {3, 8, 0, kUpb_NoSub, 13, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)};
  _upb_Message_GetNonExtensionField(msg, &field, &default_val, &ret);
  return ret;
}

UPB_INLINE void envoy_type_v3_SemanticVersion_set_major_number(envoy_type_v3_SemanticVersion *msg, uint32_t value) {
  const upb_MiniTableField field = {1, 0, 0, kUpb_NoSub, 13, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}
UPB_INLINE void envoy_type_v3_SemanticVersion_set_minor_number(envoy_type_v3_SemanticVersion *msg, uint32_t value) {
  const upb_MiniTableField field = {2, 4, 0, kUpb_NoSub, 13, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}
UPB_INLINE void envoy_type_v3_SemanticVersion_set_patch(envoy_type_v3_SemanticVersion *msg, uint32_t value) {
  const upb_MiniTableField field = {3, 8, 0, kUpb_NoSub, 13, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)};
  _upb_Message_SetNonExtensionField(msg, &field, &value);
}

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port/undef.inc"

#endif  /* ENVOY_TYPE_V3_SEMANTIC_VERSION_PROTO_UPB_H_ */
