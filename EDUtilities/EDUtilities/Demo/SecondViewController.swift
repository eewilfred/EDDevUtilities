//
//  secondViewController.swift
//  Demo
//
//  Created by Edwin Wilson on 23/08/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import UIKit

/// Note: BackRoutableViewController subclassing Demo
class SecondViewController: BackRoutableViewController {

    var array = Safe([String]())

    override func viewDidLoad() {
        super.viewDidLoad()

        // Thread Safe Demo
        array.value(execute: {$0.append("value1")})
        print("\(array.value[0])")
    }
}
