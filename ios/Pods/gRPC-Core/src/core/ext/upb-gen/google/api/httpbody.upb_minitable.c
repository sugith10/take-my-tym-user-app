/* This file was generated by upb_generator from the input file:
 *
 *     google/api/httpbody.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#include "upb/generated_code_support.h"
#include "google/api/httpbody.upb_minitable.h"
#include "google/protobuf/any.upb_minitable.h"

// Must be last.
#include "upb/port/def.inc"

static const upb_MiniTableSub google_api_HttpBody_submsgs[1] = {
  {.submsg = &google__protobuf__Any_msg_init},
};

static const upb_MiniTableField google_api_HttpBody__fields[3] = {
  {1, UPB_SIZE(4, 0), 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(12, 16), 0, kUpb_NoSub, 12, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(0, 32), 0, 0, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google__api__HttpBody_msg_init = {
  &google_api_HttpBody_submsgs[0],
  &google_api_HttpBody__fields[0],
  UPB_SIZE(24, 40), 3, kUpb_ExtMode_NonExtendable, 3, UPB_FASTTABLE_MASK(24), 0,
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x000000003f00000a, &upb_pss_1bt},
    {0x001000003f000012, &upb_psb_1bt},
    {0x002000003f00001a, &upb_prm_1bt_maxmaxb},
  })
};

static const upb_MiniTable *messages_layout[1] = {
  &google__api__HttpBody_msg_init,
};

const upb_MiniTableFile google_api_httpbody_proto_upb_file_layout = {
  messages_layout,
  NULL,
  NULL,
  1,
  0,
  0,
};

#include "upb/port/undef.inc"

