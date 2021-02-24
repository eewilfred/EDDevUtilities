//
//  UIView+Constraints.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 11/08/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import UIKit

// MARK: - Constraints

public extension UIView {

    @discardableResult
    func pinToSuperview(
        with insets: UIEdgeInsets = .zero,
        shouldRespectSafeArea: Bool = true
        ) -> [NSLayoutConstraint] {

        guard superview != nil else {
            return []
        }

        var constraints: [NSLayoutConstraint] = []

        if let leading = pinLeadingToSuperView(
            constant: insets.left,
            shouldRespectSafeArea: shouldRespectSafeArea
            ) {

            constraints.append(leading)
        }

        if let trailing = pinTrailingToSuperView(
            constant: insets.right,
            shouldRespectSafeArea: shouldRespectSafeArea
            ) {
            constraints.append(trailing)
        }

        if let top = pinTopToSuperView(
            constant: insets.top,
            shouldRespectSafeArea: shouldRespectSafeArea
            ) {
            constraints.append(top)
        }

        if let bottom = pinBottomToSuperView(
            constant: insets.bottom,
            shouldRespectSafeArea: shouldRespectSafeArea
            ) {
            constraints.append(bottom)
        }

        return constraints
    }

    @discardableResult
    func pinLeadingToSuperView(
        constant: CGFloat = 0.0,
        shouldRespectSafeArea: Bool = true
        ) -> NSLayoutConstraint? {

        guard let superview = superview else {
            return nil
        }

        translatesAutoresizingMaskIntoConstraints = false

        guard #available(iOS 11.0, *),
            superview.responds(to: #selector(getter: safeAreaLayoutGuide)) else {

            return leadingAnchor.EDUDock(
                to: superview.leadingAnchor,
                constant: constant
            )
        }

        return leadingAnchor.EDUDock(
            to: shouldRespectSafeArea ? superview.safeAreaLayoutGuide.leadingAnchor : superview.leadingAnchor,
            constant: constant
        )
    }

    @discardableResult
    func pinTrailingToSuperView(
        constant: CGFloat = 0.0,
        shouldRespectSafeArea: Bool = true
        ) -> NSLayoutConstraint? {

        guard let superview = superview else {
            return nil
        }

        translatesAutoresizingMaskIntoConstraints = false

        guard #available(iOS 11.0, *),
            superview.responds(to: #selector(getter: safeAreaLayoutGuide)) else {

            return trailingAnchor.EDUDock(
                to: superview.trailingAnchor,
                constant: constant
            )
        }

        return trailingAnchor.EDUDock(
            to: shouldRespectSafeArea ? superview.safeAreaLayoutGuide.trailingAnchor : superview.trailingAnchor,
            constant: constant
        )
    }

    @discardableResult
    func pinTopToSuperView(
        constant: CGFloat = 0.0,
        shouldRespectSafeArea: Bool = true
        ) -> NSLayoutConstraint? {

        guard let superview = superview else {
            return nil
        }

        translatesAutoresizingMaskIntoConstraints = false

        guard #available(iOS 11.0, *),
            superview.responds(to: #selector(getter: safeAreaLayoutGuide)) else {

            return topAnchor.EDUDock(
                to: superview.topAnchor,
                constant: constant
            )
        }

        return topAnchor.EDUDock(
            to: shouldRespectSafeArea ? superview.safeAreaLayoutGuide.topAnchor : superview.topAnchor,
            constant: constant
        )
    }

    @discardableResult
    func pinBottomToSuperView(
        constant: CGFloat = 0.0,
        shouldRespectSafeArea: Bool = true
        ) -> NSLayoutConstraint? {

        guard let superview = superview else {
            return nil
        }

        translatesAutoresizingMaskIntoConstraints = false

        guard #available(iOS 11.0, *),
            superview.responds(to: #selector(getter: safeAreaLayoutGuide)) else {

            return bottomAnchor.EDUDock(
                to: superview.bottomAnchor,
                constant: constant
            )
        }

        return bottomAnchor.EDUDock(
            to: shouldRespectSafeArea ? superview.safeAreaLayoutGuide.bottomAnchor : superview.bottomAnchor,
            constant: constant
        )
    }

    @discardableResult
    func pinCenterInSuperview(withInset: CGPoint = CGPoint.zero) -> [NSLayoutConstraint] {

        var constraints: [NSLayoutConstraint] = []

        if let centerXConstraint = centerHorizontallyInSuperView() {
            centerXConstraint.constant = withInset.x
            constraints.append(centerXConstraint)
        }

        if let centerYConstraint = centerVerticallyInSuperView() {
            centerYConstraint.constant = withInset.y
            constraints.append(centerYConstraint)
        }

        return constraints
    }

    @discardableResult
    func centerHorizontallyInSuperView() -> NSLayoutConstraint? {

        guard let superview = superview else {
            return nil
        }

        translatesAutoresizingMaskIntoConstraints = false

        return centerXAnchor.EDUDock(to: superview.centerXAnchor)
    }

    @discardableResult
    func centerVerticallyInSuperView() -> NSLayoutConstraint? {

        guard let superview = superview else {
            return nil
        }

        translatesAutoresizingMaskIntoConstraints = false

        return centerYAnchor.EDUDock(to: superview.centerYAnchor)
    }
}

