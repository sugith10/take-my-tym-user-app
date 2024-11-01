// Copyright 2022 The gRPC Authors
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
#include <grpc/support/port_platform.h>

#include "src/core/lib/debug/trace.h"

grpc_core::TraceFlag grpc_event_engine_trace(false, "event_engine");
grpc_core::TraceFlag grpc_event_engine_dns_trace(false, "event_engine_dns");
grpc_core::TraceFlag grpc_event_engine_endpoint_trace(false,
                                                      "event_engine_endpoint");
grpc_core::TraceFlag grpc_event_engine_endpoint_data_trace(
    false, "event_engine_endpoint_data");
grpc_core::TraceFlag grpc_event_engine_poller_trace(false,
                                                    "event_engine_poller");
