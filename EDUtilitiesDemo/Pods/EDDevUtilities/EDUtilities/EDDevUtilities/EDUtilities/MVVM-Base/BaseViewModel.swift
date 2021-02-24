//
//  BaseViewModel.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 22/02/2021.
//  Copyright © 2021 Edwin Wilson. All rights reserved.
//

import Foundation


public protocol State {}

open class BaseViewModel<S: State> {


    private var receivers: [(S)->Void] = []

    func emit(state: S) {

        for reciver in receivers {
            reciver(state)
        }
    }

    func addStateUpdateReceiver(handler: @escaping (S) -> Void) {

        receivers.append(handler)
    }
}
