/* This file was generated by upb_generator from the input file:
 *
 *     envoy/config/listener/v3/udp_listener_config.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#include "upb/generated_code_support.h"
#include "envoy/config/listener/v3/udp_listener_config.upb_minitable.h"
#include "envoy/config/core/v3/extension.upb_minitable.h"
#include "envoy/config/core/v3/udp_socket_config.upb_minitable.h"
#include "envoy/config/listener/v3/quic_config.upb_minitable.h"
#include "udpa/annotations/status.upb_minitable.h"
#include "udpa/annotations/versioning.upb_minitable.h"

// Must be last.
#include "upb/port/def.inc"

static const upb_MiniTableSub envoy_config_listener_v3_UdpListenerConfig_submsgs[3] = {
  {.submsg = &envoy__config__core__v3__UdpSocketConfig_msg_init},
  {.submsg = &envoy__config__listener__v3__QuicProtocolOptions_msg_init},
  {.submsg = &envoy__config__core__v3__TypedExtensionConfig_msg_init},
};

static const upb_MiniTableField envoy_config_listener_v3_UdpListenerConfig__fields[3] = {
  {5, UPB_SIZE(4, 8), 1, 0, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {7, UPB_SIZE(8, 16), 2, 1, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {8, UPB_SIZE(12, 24), 3, 2, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__config__listener__v3__UdpListenerConfig_msg_init = {
  &envoy_config_listener_v3_UdpListenerConfig_submsgs[0],
  &envoy_config_listener_v3_UdpListenerConfig__fields[0],
  UPB_SIZE(16, 32), 3, kUpb_ExtMode_NonExtendable, 0, UPB_FASTTABLE_MASK(120), 0,
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x000800000100002a, &upb_psm_1bt_maxmaxb},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x001000000201003a, &upb_psm_1bt_maxmaxb},
    {0x0018000003020042, &upb_psm_1bt_maxmaxb},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
  })
};

const upb_MiniTable envoy__config__listener__v3__ActiveRawUdpListenerConfig_msg_init = {
  NULL,
  NULL,
  0, 0, kUpb_ExtMode_NonExtendable, 0, UPB_FASTTABLE_MASK(255), 0,
};

static const upb_MiniTable *messages_layout[2] = {
  &envoy__config__listener__v3__UdpListenerConfig_msg_init,
  &envoy__config__listener__v3__ActiveRawUdpListenerConfig_msg_init,
};

const upb_MiniTableFile envoy_config_listener_v3_udp_listener_config_proto_upb_file_layout = {
  messages_layout,
  NULL,
  NULL,
  2,
  0,
  0,
};

#include "upb/port/undef.inc"

