//
//  RouteProtocol.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 09/03/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import UIKit


public protocol Route {

    func route(
        to: UIViewController,
        from: UIViewController,
        isWithNavigationController: Bool,
        isFullScreen: Bool,
        isAnimated: Bool
    )
}

public extension Route {

    func route(
        to: UIViewController,
        from: UIViewController,
        isWithNavigationController: Bool = true,
        isFullScreen: Bool = true,
        isAnimated: Bool = false
    ) {

        var toController = to
        if isWithNavigationController {
            toController = UINavigationController(rootViewController: to)
        }
        if isFullScreen {
            toController.modalPresentationStyle = .fullScreen
        }
        from.present(toController, animated: true, completion: nil)
    }
}
