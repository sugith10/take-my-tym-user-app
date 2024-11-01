/*
 * Copyright 2019 Google
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "FirebaseAuth/Sources/Backend/RPC/MultiFactor/Enroll/FIRStartMFAEnrollmentResponse.h"

#import "FirebaseAuth/Sources/Backend/RPC/Proto/Phone/FIRAuthProtoStartMFAPhoneResponseInfo.h"
#import "FirebaseAuth/Sources/Backend/RPC/Proto/TOTP/FIRAuthProtoStartMFATOTPEnrollmentResponseInfo.h"

@implementation FIRStartMFAEnrollmentResponse

- (BOOL)setWithDictionary:(nonnull NSDictionary *)dictionary
                    error:(NSError *__autoreleasing _Nullable *_Nullable)error {
  if (dictionary[@"phoneSessionInfo"] != nil) {
    NSDictionary *data = dictionary[@"phoneSessionInfo"];
    _phoneSessionInfo = [[FIRAuthProtoStartMFAPhoneResponseInfo alloc] initWithDictionary:data];
  } else if (dictionary[@"totpSessionInfo"] != nil) {
    NSDictionary *data = dictionary[@"totpSessionInfo"];
    _TOTPSessionInfo =
        [[FIRAuthProtoStartMFATOTPEnrollmentResponseInfo alloc] initWithDictionary:data];
  } else {
    return NO;
  }
  return YES;
}

@end
