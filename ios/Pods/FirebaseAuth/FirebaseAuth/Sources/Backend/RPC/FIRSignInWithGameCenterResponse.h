/*
 * Copyright 2018 Google
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

#import "FirebaseAuth/Sources/Backend/FIRAuthRPCResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface FIRSignInWithGameCenterResponse : NSObject <FIRAuthRPCResponse>

/** @property IDToken
    @brief Either an authorization code suitable for performing an STS token exchange, or the access
    token from Secure Token Service, depending on whether @c returnSecureToken is set on the
    request.
 */
@property(nonatomic, copy, readonly, nullable) NSString *IDToken;

/** @property refreshToken
    @brief The refresh token from Secure Token Service.
 */
@property(nonatomic, copy, readonly, nullable) NSString *refreshToken;

/** @property localID
    @brief The Firebase Auth user ID.
 */
@property(nonatomic, copy, readonly, nullable) NSString *localID;

/** @property playerID
    @brief The verified player ID.
 */
@property(nonatomic, copy, readonly, nullable) NSString *playerID;

/** @property teamPlayerID
    @brief The verified team player ID.
 */
@property(nonatomic, copy, readonly, nullable) NSString *teamPlayerID;

/** @property gamePlayerID
    @brief The verified game player ID.
 */
@property(nonatomic, copy, readonly, nullable) NSString *gamePlayerID;

/** @property approximateExpirationDate
    @brief The approximate expiration date of the access token.
 */
@property(nonatomic, copy, readonly, nullable) NSDate *approximateExpirationDate;

/** @property isNewUser
    @brief Flag indicating that the user signing in is a new user and not a returning user.
 */
@property(nonatomic, assign) BOOL isNewUser;

/** @property displayName
    @brief The user's Game Center display name.
 */
@property(nonatomic, copy, readonly, nullable) NSString *displayName;

@end

NS_ASSUME_NONNULL_END
