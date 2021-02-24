//
//  ThreadSafe.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 06/06/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import Foundation


/**
 To Make a variable Absolute thread safe,
 - Note: Use this if and ** ONLY** if if you need a built in mutex not just atomic.
 This methode will ensure data is read and written with fully locked manner
 - Warning: This will slow down access speed as we have mutex locks in place
 -
 ~~~
//USAGE:
 var arrayOfStrings: = Safe([String]())

 array.value(execute: {
     //Code To be executed
 })
 // Eg: Add item
 array.value(execute: {$0.append("value1")})
 // Eg: Read item
 print("\(array.value[0])")
 ~~~
 */


public struct Safe<Value> {
    private let mutex = DispatchQueue(label: "EDU.synchronizedbarrier", attributes: .concurrent)
    private var pValue: Value

    public init(_ value: Value) {
        self.pValue = value
    }

    public var value: Value { mutex.sync { pValue } }

    public mutating func value<T>(execute task: (inout Value) throws -> T) rethrows -> T {
        try mutex.sync(flags: .barrier) { try task(&pValue) }
    }
}
