//
// Copyright 2016 gRPC authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#ifndef GRPC_SRC_CORE_EXT_FILTERS_DEADLINE_DEADLINE_FILTER_H
#define GRPC_SRC_CORE_EXT_FILTERS_DEADLINE_DEADLINE_FILTER_H

#include <grpc/support/port_platform.h>

#include "src/core/lib/channel/channel_fwd.h"
#include "src/core/lib/channel/channel_stack.h"
#include "src/core/lib/gprpp/time.h"
#include "src/core/lib/iomgr/call_combiner.h"
#include "src/core/lib/iomgr/closure.h"
#include "src/core/lib/resource_quota/arena.h"
#include "src/core/lib/transport/transport.h"

namespace grpc_core {
class TimerState;
}  // namespace grpc_core

// State used for filters that enforce call deadlines.
// Must be the first field in the filter's call_data.
struct grpc_deadline_state {
  grpc_deadline_state(grpc_call_element* elem,
                      const grpc_call_element_args& args,
                      grpc_core::Timestamp deadline);
  ~grpc_deadline_state();

  // We take a reference to the call stack for the timer callback.
  grpc_call_element* elem;
  grpc_call_stack* call_stack;
  grpc_core::CallCombiner* call_combiner;
  grpc_core::Arena* arena;
  grpc_core::TimerState* timer_state = nullptr;
  // Closure to invoke when we receive trailing metadata.
  // We use this to cancel the timer.
  grpc_closure recv_trailing_metadata_ready;
  // The original recv_trailing_metadata_ready closure, which we chain to
  // after our own closure is invoked.
  grpc_closure* original_recv_trailing_metadata_ready;
};

// Cancels the existing timer and starts a new one with new_deadline.
//
// Note: It is generally safe to call this with an earlier deadline
// value than the current one, but not the reverse.  No checks are done
// to ensure that the timer callback is not invoked while it is in the
// process of being reset, which means that attempting to increase the
// deadline may result in the timer being called twice.
//
// Note: Must be called while holding the call combiner.
void grpc_deadline_state_reset(grpc_deadline_state* deadline_state,
                               grpc_core::Timestamp new_deadline);

// To be called from the client-side filter's start_transport_stream_op_batch()
// method.  Ensures that the deadline timer is cancelled when the call
// is completed.
//
// Note: It is the caller's responsibility to chain to the next filter if
// necessary after this function returns.
//
// Note: Must be called while holding the call combiner.
void grpc_deadline_state_client_start_transport_stream_op_batch(
    grpc_deadline_state* deadline_state, grpc_transport_stream_op_batch* op);

// Deadline filters for direct client channels and server channels.
// Note: Deadlines for non-direct client channels are handled by the
// client_channel filter.
extern const grpc_channel_filter grpc_client_deadline_filter;
extern const grpc_channel_filter grpc_server_deadline_filter;

#endif  // GRPC_SRC_CORE_EXT_FILTERS_DEADLINE_DEADLINE_FILTER_H
