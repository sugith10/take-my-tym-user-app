/*
 * Copyright 2017 Google
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

#import "FirebaseAuth/Sources/Backend/RPC/FIRGetProjectConfigRequest.h"

NS_ASSUME_NONNULL_BEGIN

/** @var kGetProjectConfigEndPoint
    @brief The "getProjectConfig" endpoint.
 */
static NSString *const kGetProjectConfigEndPoint = @"getProjectConfig";

@implementation FIRGetProjectConfigRequest

- (nullable instancetype)initWithRequestConfiguration:
    (FIRAuthRequestConfiguration *)requestConfiguration {
  requestConfiguration.HTTPMethod = @"GET";
  return [super initWithEndpoint:kGetProjectConfigEndPoint
            requestConfiguration:requestConfiguration];
}

- (BOOL)containsPostBody {
  return NO;
}

@end

NS_ASSUME_NONNULL_END
