//
//  RouteProtocolUsage.swift
//  Demo
//
//  Created by Edwin Wilson on 23/08/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import UIKit

extension ViewController: Route {

    func routeFeatureDemo() {

        if let toVc = vcExtenstionsGetVCDemo() {
            route(to: toVc, from: self)
        }
    }
}


