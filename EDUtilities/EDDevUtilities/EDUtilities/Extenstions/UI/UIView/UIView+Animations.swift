//
//  UIView+Animations.swift
//  EDUtilities
//
//  Created by Edwin Wilson on 05/05/2020.
//  Copyright © 2020 Edwin Wilson. All rights reserved.
//

import UIKit

// MARK: Animations

public extension UIView {

    @discardableResult
    func addBlur(style: UIBlurEffect.Style = .dark) -> UIVisualEffectView {

        let blurEffect = UIBlurEffect(style: style)
        let blurBackground = UIVisualEffectView(effect: blurEffect)
        addSubview(blurBackground)
        blurBackground.translatesAutoresizingMaskIntoConstraints = false
        blurBackground.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        blurBackground.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blurBackground.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        blurBackground.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        return blurBackground
    }

    func dropShadow(scale: Bool = true) {


      layer.masksToBounds = false
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.75
      layer.shadowOffset = .zero
      layer.shadowRadius = 2
    }

    func hideAnimated(removeAtEnd: Bool = false) {

        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 0.0
        }) { (_) in
            self.alpha = 1.0
            if removeAtEnd {
                self.removeFromSuperview()
            } else {
                self.isHidden = true
            }
        }
    }

}

extension UITableView {

    func reloadDataWithoutScroll() {
        let offset = contentOffset
        reloadData()
        layoutIfNeeded()
        setContentOffset(offset, animated: false)
    }
}

extension UICollectionView {

    func reloadDataWithoutScroll() {
        let offset = contentOffset
        reloadData()
        layoutIfNeeded()
        setContentOffset(offset, animated: false)
    }
}
