//
//  LayoutExtenstions.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 16/02/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import UIKit

public extension NSLayoutDimension {

    /// - Example: view.widthAnchor.EDUSet(to: CGFloat(100.0))
    @discardableResult
    func EDUSet(
        to constant: CGFloat,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(equalToConstant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }

    /// - Example: view.widthAnchor.EDUSet(lessThanOrEqualTo: CGFloat(100.0))
    @discardableResult
    func EDUSet(
        lessThanOrEqualTo constant: CGFloat,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(lessThanOrEqualToConstant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }

    /// - Example: view.widthAnchor.EDUSet(greaterThanOrEqualTo: CGFloat(100.0))
    @discardableResult
    func EDUSet(
        greaterThanOrEqualTo constant: CGFloat,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(greaterThanOrEqualToConstant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }

    /// - Example: view1.heightAnchor.EDUSet(to: view2.heightAnchor, multiplier: CGFloat(0.5))
    @discardableResult
    func EDUSet(
        to dimension: NSLayoutDimension,
        multiplier: CGFloat = CGFloat(1.0),
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(equalTo: dimension, multiplier: multiplier)
        cons.priority = priority
        cons.isActive = true
        return cons
    }

    /// - Example: view1.heightAnchor.EDUSet(lessThanOrEqualTo: view2.heightAnchor, multiplier: CGFloat(0.75))
    @discardableResult
    func EDUSet(
        lessThanOrEqualTo dimension: NSLayoutDimension,
        multiplier: CGFloat = CGFloat(1.0),
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(lessThanOrEqualTo: dimension, multiplier: multiplier)
        cons.priority = priority
        cons.isActive = true
        return cons
    }

    /// - Example: view1.heightAnchor.EDUSet(greaterThanOrEqualTo: view2.heightAnchor, multiplier: CGFloat(0.75))
    @discardableResult
    func EDUSet(
        greaterThanOrEqualTo dimension: NSLayoutDimension,
        multiplier: CGFloat = CGFloat(1.0),
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier)
        cons.priority = priority
        cons.isActive = true
        return cons
    }
}

public extension NSLayoutXAxisAnchor {

    /// - Example: view1.leadingAnchor.EDUDock(to: view2.trailingAnchor, constant: CGFloat(10.0))
    @discardableResult
    func EDUDock(
        to anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = CGFloat(0),
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(equalTo: anchor, constant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }

    /// - Example: view1.leadingAnchor.EDUDock(lessThanOrEqualTo: view2.trailingAnchor, constant: CGFloat(10.0))
    @discardableResult
    func EDUDock(
        lessThanOrEqualTo anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = CGFloat(0),
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(lessThanOrEqualTo: anchor, constant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }

    /// - Example: view1.leadingAnchor.EDUDock(greaterThanOrEqualTo: view2.trailingAnchor, constant: CGFloat(10.0))
    @discardableResult
    func EDUDock(
        greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = CGFloat(0),
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(greaterThanOrEqualTo: anchor, constant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }
}

public extension NSLayoutYAxisAnchor {

    /// - Example: view1.bottomAnchor.EDUDock(to: view2.bottomAnchor, constant: CGFloat(10.0))
    @discardableResult
    func EDUDock(
        to anchor: NSLayoutYAxisAnchor,
        constant: CGFloat = CGFloat(0),
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(equalTo: anchor, constant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }

    /// - Example: view1.leadingAnchor.EDUDock(lessThanOrEqualTo: view2.trailingAnchor, constant: CGFloat10.0))
    @discardableResult
    func EDUDock(
        lessThanOrEqualTo anchor: NSLayoutYAxisAnchor,
        constant: CGFloat = CGFloat(0),
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(lessThanOrEqualTo: anchor, constant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }

    /// - Example: view1.leadingAnchor.EDUDock(greaterThanOrEqualTo: view2.trailingAnchor, constant: CGFloat(10.0))
    @discardableResult
    func EDUDock(
        greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor,
        constant: CGFloat = CGFloat(0),
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(greaterThanOrEqualTo: anchor, constant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }
}
