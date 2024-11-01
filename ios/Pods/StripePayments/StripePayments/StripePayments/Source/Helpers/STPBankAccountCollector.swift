//
//  STPBankAccountCollector.swift
//  StripePayments
//
//  Copyright © 2022 Stripe, Inc. All rights reserved.
//

import Foundation
@_spi(STP) import StripeCore
import UIKit

/// Error codes generated by STPBankAccountCollector
@objc public enum STPCollectBankAccountError: Int {

    /// Error when using APIs that require the linking the StripeFinancialConnections SDK
    @objc(STPCollectBankAccountErrorFinancialConnectionsSDKNotLinked)
    case financialConnectionsSDKNotLinked

    /// Error when a secret can not be parsed to retrieve the ID
    @objc(STPCollectBankAccountErrorInvalidClientSecret)
    case invalidClientSecret

    /// Unexpected behavior in calling the API
    @objc(STPCollectBankAccountErrorUnexpectedError)
    case unexpectedError
}

/// A class responsible for collecting bank account information
public class STPBankAccountCollector: NSObject {

    /// By default `sharedHandler` initializes with STPAPIClient.shared.
    public var apiClient: STPAPIClient

    @objc(`init`)
    @available(swift, deprecated: 0.0.1, obsoleted: 0.0.1, renamed: "init()")
    public convenience override init() {
        self.init(apiClient: STPAPIClient.shared)
    }

    public init(
        apiClient: STPAPIClient = .shared
    ) {
        self.apiClient = apiClient
    }

    // MARK: Collect Bank Account - Payment Intent
    public typealias STPCollectBankAccountForPaymentCompletionBlock = (STPPaymentIntent?, NSError?)
        -> Void

    func error(
        for errorCode: STPCollectBankAccountError,
        userInfo additionalUserInfo: [AnyHashable: Any]? = nil
    ) -> NSError {
        var userInfo: [AnyHashable: Any] = additionalUserInfo ?? [:]
        switch errorCode {
        case .financialConnectionsSDKNotLinked:
            userInfo[STPError.errorMessageKey] =
                "StripeFinancialConnections SDK has not been linked into your project"
        case .invalidClientSecret:
            userInfo[STPError.errorMessageKey] = "Unable to parse client secret"
        case .unexpectedError:
            userInfo[STPError.errorMessageKey] = NSError.stp_unexpectedErrorMessage()
        }
        return NSError(
            domain: STPPaymentHandler.errorDomain,
            code: errorCode.rawValue,
            userInfo: userInfo as? [String: Any]
        )
    }

    /// Presents a modal from the viewController to collect bank account
    /// and if completed successfully, link your bank account to a PaymentIntent
    /// - Parameters:
    ///   - clientSecret:      Client secret of the payment intent
    ///   - params:            Parameters for this call
    ///   - viewController:    Presenting view controller that will present the modal
    ///   - completion:        Completion block to be called on completion of the operation.
    ///                        Upon success, the `STPPaymentIntent` instance will have an
    ///                        expanded `paymentMethod` containing detailed payment method information
    @objc(collectBankAccountForPaymentWithClientSecret:params:from:completion:)
    public func collectBankAccountForPayment(
        clientSecret: String,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        completion: @escaping STPCollectBankAccountForPaymentCompletionBlock
    ) {
        collectBankAccountForPayment(
            clientSecret: clientSecret,
            returnURL: nil,
            params: params,
            from: viewController,
            completion: completion
        )
    }

    /// Presents a modal from the viewController to collect bank account
    /// and if completed successfully, link your bank account to a PaymentIntent
    /// - Parameters:
    ///   - clientSecret:      Client secret of the payment intent
    ///   - returnURL:         A URL that redirects back to your app to be used to return after completing authentication in another app (such as bank app or Safari).
    ///   - params:            Parameters for this call
    ///   - viewController:    Presenting view controller that will present the modal
    ///   - completion:        Completion block to be called on completion of the operation.
    ///                        Upon success, the `STPPaymentIntent` instance will have an
    ///                        expanded `paymentMethod` containing detailed payment method information
    @objc(collectBankAccountForPaymentWithClientSecret:returnURL:params:from:completion:)
    public func collectBankAccountForPayment(
        clientSecret: String,
        returnURL: String?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        completion: @escaping STPCollectBankAccountForPaymentCompletionBlock
    ) {
        collectBankAccountForPayment(
            clientSecret: clientSecret,
            returnURL: returnURL,
            params: params,
            from: viewController,
            onEvent: nil,
            completion: completion
        )
    }

    /// Presents a modal from the viewController to collect bank account
    /// and if completed successfully, link your bank account to a PaymentIntent
    /// - Parameters:
    ///   - clientSecret:      Client secret of the payment intent
    ///   - returnURL:         A URL that redirects back to your app to be used to return after completing authentication in another app (such as bank app or Safari).
    ///   - params:            Parameters for this call
    ///   - viewController:    Presenting view controller that will present the modal
    ///   - onEvent:           The `onEvent` closure is triggered upon the occurrence of specific events during the process of a user connecting their financial accounts.
    ///   - completion:        Completion block to be called on completion of the operation.
    ///                        Upon success, the `STPPaymentIntent` instance will have an
    ///                        expanded `paymentMethod` containing detailed payment method information
    public func collectBankAccountForPayment(
        clientSecret: String,
        returnURL: String?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        onEvent: ((FinancialConnectionsEvent) -> Void)?,
        completion: @escaping STPCollectBankAccountForPaymentCompletionBlock
    ) {
        guard let paymentIntentID = STPPaymentIntent.id(fromClientSecret: clientSecret) else {
            completion(nil, error(for: .invalidClientSecret))
            return
        }
        let financialConnectionsCompletion:
            (FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?) -> Void = {
                result,
                linkAccountSession,
                error in
                if let error = error {
                    completion(
                        nil,
                        self.error(for: .unexpectedError, userInfo: [NSUnderlyingErrorKey: error])
                    )
                    return
                }
                guard let linkAccountSession = linkAccountSession,
                    let result = result
                else {
                    completion(nil, NSError.stp_genericFailedToParseResponseError())
                    return
                }

                switch result {
                case .completed:
                    self.attachLinkAccountSessionToPaymentIntent(
                        paymentIntentID: paymentIntentID,
                        clientSecret: clientSecret,
                        linkAccountSession: linkAccountSession,
                        completion: completion
                    )
                case .cancelled:
                    self.apiClient.retrievePaymentIntent(withClientSecret: clientSecret) {
                        intent,
                        error in
                        if let intent = intent {
                            completion(intent, nil)
                        } else if let error = error {
                            completion(
                                nil,
                                self.error(
                                    for: .unexpectedError,
                                    userInfo: [NSUnderlyingErrorKey: error]
                                )
                            )
                        } else {
                            completion(nil, self.error(for: .unexpectedError))
                        }
                    }
                case .failed(let error):
                    completion(
                        nil,
                        self.error(for: .unexpectedError, userInfo: [NSUnderlyingErrorKey: error])
                    )
                }
            }
        collectBankAccountForPayment(
            clientSecret: clientSecret,
            returnURL: returnURL,
            onEvent: onEvent,
            params: params,
            from: viewController,
            financialConnectionsCompletion: financialConnectionsCompletion
        )
    }

    @_spi(STP) public func collectBankAccountForPayment(
        clientSecret: String,
        returnURL: String?,
        onEvent: ((FinancialConnectionsEvent) -> Void)?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        financialConnectionsCompletion: @escaping (
            FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?
        ) -> Void
    ) {
        guard
            let financialConnectionsAPI = FinancialConnectionsSDKAvailability.financialConnections()
        else {
            assertionFailure("FinancialConnections SDK has not been linked into your project")
            financialConnectionsCompletion(nil, nil, error(for: .financialConnectionsSDKNotLinked))
            return
        }

        guard let paymentIntentID = STPPaymentIntent.id(fromClientSecret: clientSecret) else {
            financialConnectionsCompletion(nil, nil, error(for: .invalidClientSecret))
            return
        }

        let linkAccountSessionCallback: STPLinkAccountSessionBlock = { linkAccountSession, error in
            if let error = error {
                financialConnectionsCompletion(
                    nil,
                    nil,
                    self.error(for: .unexpectedError, userInfo: [NSUnderlyingErrorKey: error])
                )
                return
            }
            guard let linkAccountSession = linkAccountSession else {
                financialConnectionsCompletion(
                    nil,
                    nil,
                    NSError.stp_genericFailedToParseResponseError()
                )
                return
            }
            financialConnectionsAPI.presentFinancialConnectionsSheet(
                apiClient: self.apiClient,
                clientSecret: linkAccountSession.clientSecret,
                returnURL: returnURL,
                onEvent: onEvent,
                from: viewController
            ) { result in
                financialConnectionsCompletion(result, linkAccountSession, nil)
            }
        }

        apiClient.createLinkAccountSession(
            paymentIntentID: paymentIntentID,
            clientSecret: clientSecret,
            paymentMethodType: params.paymentMethodParams.type,
            customerName: params.paymentMethodParams.billingDetails?.name,
            customerEmailAddress: params.paymentMethodParams.billingDetails?.email,
            completion: linkAccountSessionCallback
        )
    }

    // MARK: Helper
    private func attachLinkAccountSessionToPaymentIntent(
        paymentIntentID: String,
        clientSecret: String,
        linkAccountSession: LinkAccountSession,
        completion: @escaping STPCollectBankAccountForPaymentCompletionBlock
    ) {
        STPAPIClient.shared.attachLinkAccountSession(
            paymentIntentID: paymentIntentID,
            linkAccountSessionID: linkAccountSession.stripeID,
            clientSecret: clientSecret
        ) { paymentIntent, error in
            if let error = error {
                completion(
                    nil,
                    self.error(for: .unexpectedError, userInfo: [NSUnderlyingErrorKey: error])
                )
                return
            }
            guard let paymentIntent = paymentIntent else {
                completion(nil, NSError.stp_genericFailedToParseResponseError())
                return
            }
            completion(paymentIntent, nil)
        }
    }

    // MARK: Collect Bank Account - Setup Intent
    public typealias STPCollectBankAccountForSetupCompletionBlock = (STPSetupIntent?, NSError?) ->
        Void

    /// Presents a modal from the viewController to collect bank account
    /// and if completed successfully, link your bank account to a SetupIntent
    /// - Parameters:
    ///   - clientSecret:      Client secret of the setup intent
    ///   - params:            Parameters for this call
    ///   - viewController:    Presenting view controller that will present the modal
    ///   - completion:        Completion block to be called on completion of the operation.
    ///                        Upon success, the `STPSetupIntent` instance will have an
    ///                        expanded `paymentMethod` containing detailed payment method information
    @objc(collectBankAccountForSetupWithClientSecret:params:from:completion:)
    public func collectBankAccountForSetup(
        clientSecret: String,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        completion: @escaping STPCollectBankAccountForSetupCompletionBlock
    ) {
        collectBankAccountForSetup(
            clientSecret: clientSecret,
            returnURL: nil,
            params: params,
            from: viewController,
            completion: completion
        )
    }

    /// Presents a modal from the viewController to collect bank account
    /// and if completed successfully, link your bank account to a SetupIntent
    /// - Parameters:
    ///   - clientSecret:      Client secret of the setup intent
    ///   - returnURL:         A URL that redirects back to your app to be used to return after completing authentication in another app (such as bank app or Safari).
    ///   - params:            Parameters for this call
    ///   - viewController:    Presenting view controller that will present the modal
    ///   - completion:        Completion block to be called on completion of the operation.
    ///                        Upon success, the `STPSetupIntent` instance will have an
    ///                        expanded `paymentMethod` containing detailed payment method information
    @objc(collectBankAccountForSetupWithClientSecret:returnURL:params:from:completion:)
    public func collectBankAccountForSetup(
        clientSecret: String,
        returnURL: String?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        completion: @escaping STPCollectBankAccountForSetupCompletionBlock
    ) {
        collectBankAccountForSetup(
            clientSecret: clientSecret,
            returnURL: returnURL,
            params: params,
            from: viewController,
            onEvent: nil,
            completion: completion
        )
    }

    /// Presents a modal from the viewController to collect bank account
    /// and if completed successfully, link your bank account to a SetupIntent
    /// - Parameters:
    ///   - clientSecret:      Client secret of the setup intent
    ///   - returnURL:         A URL that redirects back to your app to be used to return after completing authentication in another app (such as bank app or Safari).
    ///   - params:            Parameters for this call
    ///   - viewController:    Presenting view controller that will present the modal
    ///   - onEvent:           The `onEvent` closure is triggered upon the occurrence of specific events during the process of a user connecting their financial accounts.
    ///   - completion:        Completion block to be called on completion of the operation.
    ///                        Upon success, the `STPSetupIntent` instance will have an
    ///                        expanded `paymentMethod` containing detailed payment method information
    public func collectBankAccountForSetup(
        clientSecret: String,
        returnURL: String?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        onEvent: ((FinancialConnectionsEvent) -> Void)?,
        completion: @escaping STPCollectBankAccountForSetupCompletionBlock
    ) {
        guard let setupIntentID = STPSetupIntent.id(fromClientSecret: clientSecret) else {
            completion(nil, error(for: .invalidClientSecret))
            return
        }
        let financialConnectionsCompletion:
            (FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?) -> Void = {
                result,
                linkAccountSession,
                error in
                if let error = error {
                    completion(
                        nil,
                        self.error(for: .unexpectedError, userInfo: [NSUnderlyingErrorKey: error])
                    )
                    return
                }
                guard let linkAccountSession = linkAccountSession,
                    let result = result
                else {
                    completion(nil, NSError.stp_genericFailedToParseResponseError())
                    return
                }
                switch result {
                case .completed:
                    self.attachLinkAccountSessionToSetupIntent(
                        setupIntentID: setupIntentID,
                        clientSecret: clientSecret,
                        linkAccountSession: linkAccountSession,
                        completion: completion
                    )
                case .cancelled:
                    self.apiClient.retrieveSetupIntent(withClientSecret: clientSecret) {
                        intent,
                        error in
                        if let intent = intent {
                            completion(intent, nil)
                        } else if let error = error {
                            completion(
                                nil,
                                self.error(
                                    for: .unexpectedError,
                                    userInfo: [NSUnderlyingErrorKey: error]
                                )
                            )
                        } else {
                            completion(nil, self.error(for: .unexpectedError))
                        }
                    }
                case .failed(let error):
                    completion(
                        nil,
                        self.error(for: .unexpectedError, userInfo: [NSUnderlyingErrorKey: error])
                    )
                }
            }
        collectBankAccountForSetup(
            clientSecret: clientSecret,
            returnURL: returnURL,
            onEvent: onEvent,
            params: params,
            from: viewController,
            financialConnectionsCompletion: financialConnectionsCompletion
        )
    }

    @_spi(STP) public func collectBankAccountForSetup(
        clientSecret: String,
        returnURL: String?,
        onEvent: ((FinancialConnectionsEvent) -> Void)?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        financialConnectionsCompletion: @escaping (
            FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?
        ) -> Void
    ) {
        guard
            let financialConnectionsAPI = FinancialConnectionsSDKAvailability.financialConnections()
        else {
            assertionFailure("FinancialConnections SDK has not been linked into your project")
            financialConnectionsCompletion(nil, nil, error(for: .financialConnectionsSDKNotLinked))
            return
        }
        guard let setupIntentID = STPSetupIntent.id(fromClientSecret: clientSecret) else {
            financialConnectionsCompletion(nil, nil, error(for: .invalidClientSecret))
            return
        }
        let linkAccountSessionCallback: STPLinkAccountSessionBlock = { linkAccountSession, error in
            if let error = error {
                financialConnectionsCompletion(
                    nil,
                    nil,
                    self.error(for: .unexpectedError, userInfo: [NSUnderlyingErrorKey: error])
                )
                return
            }
            guard let linkAccountSession = linkAccountSession else {
                financialConnectionsCompletion(
                    nil,
                    nil,
                    NSError.stp_genericFailedToParseResponseError()
                )
                return
            }
            financialConnectionsAPI.presentFinancialConnectionsSheet(
                apiClient: self.apiClient,
                clientSecret: linkAccountSession.clientSecret,
                returnURL: returnURL,
                onEvent: onEvent,
                from: viewController
            ) { result in
                financialConnectionsCompletion(result, linkAccountSession, nil)
            }
        }
        apiClient.createLinkAccountSession(
            setupIntentID: setupIntentID,
            clientSecret: clientSecret,
            paymentMethodType: params.paymentMethodParams.type,
            customerName: params.paymentMethodParams.billingDetails?.name,
            customerEmailAddress: params.paymentMethodParams.billingDetails?.email,
            completion: linkAccountSessionCallback
        )
    }

    // MARK: Helper
    private func attachLinkAccountSessionToSetupIntent(
        setupIntentID: String,
        clientSecret: String,
        linkAccountSession: LinkAccountSession,
        completion: @escaping STPCollectBankAccountForSetupCompletionBlock
    ) {
        STPAPIClient.shared.attachLinkAccountSession(
            setupIntentID: setupIntentID,
            linkAccountSessionID: linkAccountSession.stripeID,
            clientSecret: clientSecret
        ) { setupIntent, error in
            if let error = error {
                completion(
                    nil,
                    self.error(for: .unexpectedError, userInfo: [NSUnderlyingErrorKey: error])
                )
                return
            }
            guard let setupIntent = setupIntent else {
                completion(nil, NSError.stp_genericFailedToParseResponseError())
                return
            }
            completion(setupIntent, nil)
        }
    }

    // MARK: - Collect Bank Account - Deferred Intent
    @_spi(STP) public func collectBankAccountForDeferredIntent(
        sessionId: String,
        returnURL: String?,
        onEvent: ((FinancialConnectionsEvent) -> Void)?,
        amount: Int?,
        currency: String?,
        onBehalfOf: String?,
        from viewController: UIViewController,
        financialConnectionsCompletion: @escaping (
            FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?
        ) -> Void
    ) {
        guard
            let financialConnectionsAPI = FinancialConnectionsSDKAvailability.financialConnections()
        else {
            assertionFailure("FinancialConnections SDK has not been linked into your project")
            financialConnectionsCompletion(nil, nil, error(for: .financialConnectionsSDKNotLinked))
            return
        }

        apiClient.createLinkAccountSessionForDeferredIntent(
            sessionId: sessionId,
            amount: amount,
            currency: currency,
            onBehalfOf: onBehalfOf
        ) { linkAccountSession, error in
            if let error = error {
                financialConnectionsCompletion(nil, nil, self.error(for: .unexpectedError, userInfo: [NSUnderlyingErrorKey: error]))
                return
            }
            guard let linkAccountSession = linkAccountSession else {
                financialConnectionsCompletion(nil, nil, NSError.stp_genericFailedToParseResponseError())
                return
            }
            financialConnectionsAPI.presentFinancialConnectionsSheet(
                apiClient: self.apiClient,
                clientSecret: linkAccountSession.clientSecret,
                returnURL: returnURL,
                onEvent: onEvent,
                from: viewController
            ) { result in
                financialConnectionsCompletion(result, linkAccountSession, nil)
            }
        }
    }
}
