//
//  UIViewController+BackRoutable.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 05/05/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import UIKit

open class BackRoutableViewController: UIViewController, BackRoutable {

    open override func viewDidLoad() {

        super.viewDidLoad()
        configureBackRoute()
    }
}

public protocol BackRoutable: UIViewController {

    func configureBackRoute()
}

extension BackRoutable {

    public func configureBackRoute() {

        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: UIBarButtonItem.Style.done,
            target: self, action: #selector(closeScreenForBackRoutable)
        )
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
}

fileprivate extension UIViewController {

    @objc func closeScreenForBackRoutable() {

        parent?.dismiss(animated: true, completion: nil)
    }
}

