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

#import <Foundation/Foundation.h>

#import "FIRFederatedAuthProvider.h"

@class FIRAuth;
@class FIROAuthCredential;

NS_ASSUME_NONNULL_BEGIN

/** @class FIROAuthProvider
    @brief A concrete implementation of `AuthProvider` for generic OAuth Providers.
 */
NS_SWIFT_NAME(OAuthProvider)
@interface FIROAuthProvider : NSObject <FIRFederatedAuthProvider>

/** @property scopes
    @brief Array used to configure the OAuth scopes.
 */
@property(nonatomic, copy, nullable) NSArray<NSString *> *scopes;

/** @property customParameters
    @brief Dictionary used to configure the OAuth custom parameters.
 */
@property(nonatomic, copy, nullable) NSDictionary<NSString *, NSString *> *customParameters;

/** @property providerID
    @brief The provider ID indicating the specific OAuth provider this OAuthProvider instance
          represents.
 */
@property(nonatomic, copy, readonly) NSString *providerID;

/** @fn providerWithProviderID:
    @param providerID The provider ID of the IDP for which this auth provider instance will be
        configured.
    @return An instance of `OAuthProvider` corresponding to the specified provider ID.
 */
+ (FIROAuthProvider *)providerWithProviderID:(NSString *)providerID;

/** @fn providerWithProviderID:auth:
    @param providerID The provider ID of the IDP for which this auth provider instance will be
        configured.
    @param auth The auth instance to be associated with the `OAuthProvider` instance.
    @return An instance of `OAuthProvider` corresponding to the specified provider ID.
 */
+ (FIROAuthProvider *)providerWithProviderID:(NSString *)providerID auth:(FIRAuth *)auth;

/** @fn credentialWithProviderID:IDToken:accessToken:
    @brief Creates an `AuthCredential` for the OAuth 2 provider identified by provider ID, ID
        token, and access token.

    @param providerID The provider ID associated with the Auth credential being created.
    @param IDToken The IDToken associated with the Auth credential being created.
    @param accessToken The access token associated with the Auth credential be created, if
        available.
    @return A `AuthCredential` for the specified provider ID, ID token and access token.
 */
+ (FIROAuthCredential *)credentialWithProviderID:(NSString *)providerID
                                         IDToken:(NSString *)IDToken
                                     accessToken:(nullable NSString *)accessToken;

/** @fn credentialWithProviderID:accessToken:
    @brief Creates an `AuthCredential` for the OAuth 2 provider identified by provider ID using
      an ID token.

    @param providerID The provider ID associated with the Auth credential being created.
    @param accessToken The access token associated with the Auth credential be created
    @return An `AuthCredential`.
 */
+ (FIROAuthCredential *)credentialWithProviderID:(NSString *)providerID
                                     accessToken:(NSString *)accessToken;

/** @fn credentialWithProviderID:IDToken:rawNonce:accessToken:
    @brief Creates an `AuthCredential` for that OAuth 2 provider identified by provider ID, ID
        token, raw nonce, and access token.

    @param providerID The provider ID associated with the Auth credential being created.
    @param IDToken The IDToken associated with the Auth credential being created.
    @param rawNonce The raw nonce associated with the Auth credential being created.
    @param accessToken The access token associated with the Auth credential be created, if
        available.
    @return A `AuthCredential` for the specified provider ID, ID token and access token.
 */
+ (FIROAuthCredential *)credentialWithProviderID:(NSString *)providerID
                                         IDToken:(NSString *)IDToken
                                        rawNonce:(nullable NSString *)rawNonce
                                     accessToken:(nullable NSString *)accessToken;

/** @fn credentialWithProviderID:IDToken:rawNonce:
    @brief Creates an `AuthCredential` for that OAuth 2 provider identified by providerID using
      an ID token and raw nonce.

    @param providerID The provider ID associated with the Auth credential being created.
    @param IDToken The IDToken associated with the Auth credential being created.
    @param rawNonce The raw nonce associated with the Auth credential being created.
    @return A `AuthCredential`.
 */
+ (FIROAuthCredential *)credentialWithProviderID:(NSString *)providerID
                                         IDToken:(NSString *)IDToken
                                        rawNonce:(nullable NSString *)rawNonce;

/** @fn appleCredentialWithIDToken:rawNonce:fullName:
 *  @brief Creates an `AuthCredential` for the Sign in with Apple OAuth 2 provider identified by ID
 * token, raw nonce, and full name. This method is specific to the Sign in with Apple OAuth 2
 * provider as this provider requires the full name to be passed explicitly.
 *
 *  @param IDToken The IDToken associated with the Sign in with Apple Auth credential being created.
 *  @param rawNonce The raw nonce associated with the Sign in with Apple Auth credential being
 * created.
 *  @param fullName The full name associated with the Sign in with Apple Auth credential being
 * created.
 *  @return An `AuthCredential`.
 */
+ (FIROAuthCredential *)appleCredentialWithIDToken:(NSString *)IDToken
                                          rawNonce:(nullable NSString *)rawNonce
                                          fullName:(nullable NSPersonNameComponents *)fullName;

/** @fn init
    @brief This class is not meant to be initialized.
 */
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
