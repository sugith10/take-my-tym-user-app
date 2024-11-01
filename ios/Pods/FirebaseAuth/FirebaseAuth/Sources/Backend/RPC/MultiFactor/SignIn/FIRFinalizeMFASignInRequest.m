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

#import "FirebaseAuth/Sources/Backend/RPC/MultiFactor/SignIn/FIRFinalizeMFASignInRequest.h"

static NSString *const kFinalizeMFASignInEndPoint = @"accounts/mfaSignIn:finalize";

/** @var kTenantIDKey
    @brief The key for the tenant id value in the request.
 */
static NSString *const kTenantIDKey = @"tenantId";

@implementation FIRFinalizeMFASignInRequest

- (nullable instancetype)initWithMFAPendingCredential:(NSString *)MFAPendingCredential
                                     verificationInfo:(NSObject<FIRAuthProto> *)verificationInfo
                                 requestConfiguration:
                                     (FIRAuthRequestConfiguration *)requestConfiguration {
  self = [super initWithEndpoint:kFinalizeMFASignInEndPoint
            requestConfiguration:requestConfiguration];
  self.useIdentityPlatform = YES;
  if (self) {
    _MFAPendingCredential = MFAPendingCredential;
    _verificationInfo = verificationInfo;
  }
  return self;
}

- (nullable id)unencodedHTTPRequestBodyWithError:(NSError *__autoreleasing _Nullable *)error {
  NSMutableDictionary *postBody = [NSMutableDictionary dictionary];
  if (_MFAPendingCredential) {
    postBody[@"mfaPendingCredential"] = _MFAPendingCredential;
  }
  if (_verificationInfo) {
    if ([_verificationInfo isKindOfClass:[FIRAuthProtoFinalizeMFAPhoneRequestInfo class]]) {
      postBody[@"phoneVerificationInfo"] = [_verificationInfo dictionary];
    }
    if ([_verificationInfo isKindOfClass:[FIRAuthProtoFinalizeMFATOTPSignInRequestInfo class]]) {
      postBody[@"totpVerificationInfo"] = [_verificationInfo dictionary];
      FIRAuthProtoFinalizeMFATOTPSignInRequestInfo *fIRAuthProtoFinalizeMFATotpSignInRequestInfo =
          (FIRAuthProtoFinalizeMFATOTPSignInRequestInfo *)_verificationInfo;
      // mfaEnrollmentID only required for TOTP
      // https://source.corp.google.com/piper///depot/google3/google/cloud/identitytoolkit/v2/authentication_service.proto;l=139?q=symbol:google.cloud.identitytoolkit.v2.FinalizeMfaSignInRequest
      postBody[@"mfaEnrollmentId"] = fIRAuthProtoFinalizeMFATotpSignInRequestInfo.mfaEnrollmentID;
    }
  }
  if (self.tenantID) {
    postBody[kTenantIDKey] = self.tenantID;
  }
  return [postBody copy];
}

@end
