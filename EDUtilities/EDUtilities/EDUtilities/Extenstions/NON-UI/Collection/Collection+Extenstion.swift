//
//  Collection+Extenstion.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 31/08/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import Foundation

public extension Collection {

    subscript(safe index: Index) -> Element? {

        return indices.contains(index) ? self[index] : nil
    }
}
