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

#import <Foundation/Foundation.h>

#import "FIRMultiFactorAssertion.h"

NS_ASSUME_NONNULL_BEGIN

/** @class FIRPhoneMultiFactorAssertion
    @brief The subclass of base class FIRMultiFactorAssertion, used to assert ownership of a phone
        second factor.
        This class is available on iOS only.
*/
NS_SWIFT_NAME(PhoneMultiFactorAssertion) API_UNAVAILABLE(macos, tvos, watchos)
    @interface FIRPhoneMultiFactorAssertion : FIRMultiFactorAssertion

@end

NS_ASSUME_NONNULL_END
