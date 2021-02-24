//
//  Array+Extenstions.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 27/02/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import Foundation

extension Array {

    func split(by distance: Int) -> [[Element]] {
        let indicesSequence = stride(from: startIndex, to: endIndex, by: distance)
        let array: [[Element]] = indicesSequence.map {
            let nextIndex = $0.advanced(by: distance) > endIndex ? endIndex : $0.advanced(by: distance)
            return Array(self[$0 ..< nextIndex])
        }
        return array
    }
}
