//
//  LinkMoreInfoView.swift
//  StripePaymentSheet
//
//  Created by Bill Meltsner on 6/7/22.
//  Copyright © 2022 Stripe, Inc. All rights reserved.
//

@_spi(STP) import StripePayments
@_spi(STP) import StripePaymentsUI
@_spi(STP) import StripeUICore
import UIKit

/// For internal SDK use only
@objc(STP_Internal_LinkMoreInfoView)
final class LinkMoreInfoView: UIView {
    struct Constants {
        static let logoWidth: CGFloat = 31
        static let logoHeight: CGFloat = 14
    }
    private lazy var logoView: UIImageView = {
        let imageView = UIImageView(image: Image.link_logo.makeImage(template: true))
        imageView.tintColor = theme.colors.secondaryText
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isAccessibilityElement = true
        imageView.accessibilityLabel = STPPaymentMethodType.link.displayName
        return imageView
    }()

    private let theme: ElementsUITheme

    init(theme: ElementsUITheme = .default) {
        self.theme = theme
        super.init(frame: .zero)
        let stackView = UIStackView(arrangedSubviews: [logoView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),

            logoView.widthAnchor.constraint(equalToConstant: Constants.logoWidth),
            logoView.heightAnchor.constraint(equalToConstant: Constants.logoHeight),
        ])
    }

    override var intrinsicContentSize: CGSize {
        .init(width: Constants.logoWidth, height: Constants.logoHeight)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
