//
//  UIView+Instantiatable.swift
//  UnitTestSample
//
//  Created by Yoshiyuki Tanaka on 2018/01/30.
//  Copyright 2018 yoshiyuki tanaka. All rights reserved.
//

import UIKit

protocol NibInstantiatable {}
extension UIView: NibInstantiatable {}

extension NibInstantiatable where Self: UIView {
    static func instantiate(withOwner ownerOrNil: Any? = nil) -> Self {
        let nib = UINib(nibName: String(describing: self), bundle: nil)
        return nib.instantiate(withOwner: ownerOrNil, options: nil)[0] as! Self
    }
}
