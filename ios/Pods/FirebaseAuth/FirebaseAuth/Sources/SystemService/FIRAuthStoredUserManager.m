/*
 * Copyright 2019 Google
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

#import "FirebaseAuth/Sources/SystemService/FIRAuthStoredUserManager.h"

#import "FirebaseAuth/Sources/User/FIRUser_Internal.h"

/** @var kUserAccessGroupKey
    @brief Key of user access group stored in user defaults. Used for retrieve the user access
        group at launch.
 */
static NSString *kStoredUserAccessGroupKey = @"firebase_auth_stored_user_access_group";

/** @var kSharedKeychainAccountValue
    @brief Default value for kSecAttrAccount of shared keychain items.
 */
static NSString *kSharedKeychainAccountValue = @"firebase_auth_firebase_user";

/** @var kStoredUserCoderKey
    @brief The key to encode and decode the stored user.
 */
static NSString *kStoredUserCoderKey = @"firebase_auth_stored_user_coder_key";

@implementation FIRAuthStoredUserManager

#pragma mark - Initializers

- (instancetype)initWithServiceName:(NSString *)serviceName {
  self = [super init];
  if (self) {
    _keychainServices = [[FIRAuthKeychainServices alloc] initWithService:serviceName];
    _userDefaults = [[FIRAuthUserDefaults alloc] initWithService:serviceName];
  }
  return self;
}

#pragma mark - User Access Group

- (NSString *_Nullable)getStoredUserAccessGroup {
  NSData *data = [self.userDefaults dataForKey:kStoredUserAccessGroupKey error:NULL];
  if (data) {
    NSString *userAccessGroup = [NSString stringWithUTF8String:data.bytes];
    return userAccessGroup;
  } else {
    return nil;
  }
}

- (BOOL)setStoredUserAccessGroup:(NSString *_Nullable)accessGroup {
  NSData *data = [accessGroup dataUsingEncoding:NSUTF8StringEncoding];
  if (!data) {
    return [self.userDefaults removeDataForKey:kStoredUserAccessGroupKey error:NULL];
  } else {
    return [self.userDefaults setData:data forKey:kStoredUserAccessGroupKey error:NULL];
  }
}

#pragma mark - User for Access Group

- (FIRUser *)getStoredUserForAccessGroup:(NSString *)accessGroup
             shareAuthStateAcrossDevices:(BOOL)shareAuthStateAcrossDevices
                       projectIdentifier:(NSString *)projectIdentifier
                                   error:(NSError *_Nullable *_Nullable)outError {
  NSMutableDictionary *query = [self keychainQueryForAccessGroup:accessGroup
                                     shareAuthStateAcrossDevices:shareAuthStateAcrossDevices
                                               projectIdentifier:projectIdentifier];
  NSData *data = [self.keychainServices getItemWithQuery:query error:outError];
  // If there's an outError parameter and it's populated, or there's no data, return.
  if ((outError && *outError) || !data) {
    return nil;
  }
#if TARGET_OS_WATCH
  NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingFromData:data
                                                                              error:outError];
  if (outError && *outError) {
    return nil;
  }
#else
  // iOS 12 deprecation
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
#pragma clang diagnostic pop
#endif  // TARGET_OS_WATCH
  FIRUser *user = [unarchiver decodeObjectOfClass:[FIRUser class] forKey:kStoredUserCoderKey];

  return user;
}

- (BOOL)setStoredUser:(FIRUser *)user
                 forAccessGroup:(NSString *)accessGroup
    shareAuthStateAcrossDevices:(BOOL)shareAuthStateAcrossDevices
              projectIdentifier:(NSString *)projectIdentifier
                          error:(NSError *_Nullable *_Nullable)outError {
  NSMutableDictionary *query = [self keychainQueryForAccessGroup:accessGroup
                                     shareAuthStateAcrossDevices:shareAuthStateAcrossDevices
                                               projectIdentifier:projectIdentifier];
  if (shareAuthStateAcrossDevices) {
    query[(__bridge id)kSecAttrAccessible] = (__bridge id)kSecAttrAccessibleAfterFirstUnlock;
  } else {
    query[(__bridge id)kSecAttrAccessible] =
        (__bridge id)kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
  }
#if TARGET_OS_WATCH
  NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initRequiringSecureCoding:false];
#else
  NSMutableData *data = [NSMutableData data];
  // iOS 12 deprecation
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
#pragma clang diagnostic pop
#endif  // TARGET_OS_WATCH
  [archiver encodeObject:user forKey:kStoredUserCoderKey];
  [archiver finishEncoding];

#if TARGET_OS_WATCH
  NSData *data = archiver.encodedData;
#endif  // TARGET_OS_WATCH

  return [self.keychainServices setItem:data withQuery:query error:outError];
}

- (BOOL)removeStoredUserForAccessGroup:(NSString *)accessGroup
           shareAuthStateAcrossDevices:(BOOL)shareAuthStateAcrossDevices
                     projectIdentifier:(NSString *)projectIdentifier
                                 error:(NSError *_Nullable *_Nullable)outError {
  NSMutableDictionary *query = [self keychainQueryForAccessGroup:accessGroup
                                     shareAuthStateAcrossDevices:shareAuthStateAcrossDevices
                                               projectIdentifier:projectIdentifier];
  if (shareAuthStateAcrossDevices) {
    query[(__bridge id)kSecAttrAccessible] = (__bridge id)kSecAttrAccessibleAfterFirstUnlock;
  } else {
    query[(__bridge id)kSecAttrAccessible] =
        (__bridge id)kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
  }
  return [self.keychainServices removeItemWithQuery:query error:outError];
}

#pragma mark - Internal Methods

- (NSMutableDictionary *)keychainQueryForAccessGroup:(NSString *)accessGroup
                         shareAuthStateAcrossDevices:(BOOL)shareAuthStateAcrossDevices
                                   projectIdentifier:(NSString *)projectIdentifier {
  NSMutableDictionary *query = [[NSMutableDictionary alloc] init];
  query[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
  query[(__bridge id)kSecAttrAccessGroup] = accessGroup;
  query[(__bridge id)kSecAttrService] = projectIdentifier;
  query[(__bridge id)kSecAttrAccount] = kSharedKeychainAccountValue;

  if (@available(iOS 13.0, macOS 10.15, macCatalyst 13.0, tvOS 13.0, watchOS 6.0, *)) {
    /*
      "The data protection key affects operations only in macOS.
      Other platforms automatically behave as if the key is set to true,
      and ignore the key in the query dictionary. You can safely use the key on all platforms."
      [kSecUseDataProtectionKeychain](https://developer.apple.com/documentation/security/ksecusedataprotectionkeychain)
    */
    query[(__bridge id)kSecUseDataProtectionKeychain] = (__bridge id)kCFBooleanTrue;
  }

  if (shareAuthStateAcrossDevices) {
    query[(__bridge id)kSecAttrSynchronizable] = (__bridge id)kCFBooleanTrue;
  }

  return query;
}

@end
