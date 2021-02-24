//
//  UIViewController+Extenstions.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 12/08/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import UIKit

public extension UIViewController {

    private func getRawClassName(object: AnyClass) -> String {
        let name = NSStringFromClass(object)
        let components = name.components(separatedBy: ".")
        return components.last ?? "Unknown"
    }

    /// Note: Add StoryBoard ID as class name in XIB
    static func getVC<T: UIViewController>() -> T? {

        let name = NSStringFromClass(self)
        let components = name.components(separatedBy: ".")
        let className = components.last ?? "Unknown"
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: className) as? T
    }
}
