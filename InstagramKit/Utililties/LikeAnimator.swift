//
//  LikeAnimator.swift
//  InstagramKit
//
//  Created by Appernaut on 06/06/21.
//

import UIKit

class LikeAnimator {
    let container: UIView
    let layoutConstraint: NSLayoutConstraint
    
    init(container: UIView, layoutConstraint: NSLayoutConstraint) {
        self.container = container
        self.layoutConstraint = layoutConstraint
    }
    
    func animate(_ completion: @escaping () -> Void) {
        layoutConstraint.constant = 150
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveLinear) { [weak self] in
            self?.container.layoutIfNeeded()
        } completion: { [weak self] _ in
            self?.layoutConstraint.constant = 0
            UIView.animate(withDuration: 0.3) {
                self?.container.layoutIfNeeded()
                completion()
            }
        }

    }
}
