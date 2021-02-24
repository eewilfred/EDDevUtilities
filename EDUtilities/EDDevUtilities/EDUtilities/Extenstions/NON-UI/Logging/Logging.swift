//
//  Logging.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 26/05/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import Foundation



public func log(_ items: Any...) {
    #if DEBUG
        print(items)
    #endif
}
