//
//  UIViewExtenstions.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 16/02/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import UIKit

// MARK: - Life Cycle

public extension UIView {
    class func fromNib<T: UIView>() throws -> T {
        let bundle = Bundle(for: T.self)
        let selfDdescription = String(describing: T.self)
        if let results = bundle.loadNibNamed(selfDdescription,
                                              owner: nil,
                                              options: nil),
            let result = results[safe: 0] as? T
        {
            return result
        }

        throw NSError(
            domain: "Nib with name \(selfDdescription) Not found. Make sure Class name and Bundle Name is same",
            code: 404,
            userInfo: nil
        )
    }
}
