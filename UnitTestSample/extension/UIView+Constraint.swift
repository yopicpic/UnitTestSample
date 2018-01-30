//
//  UIView+Constraint.swift
//  UnitTestSample
//
//  Created by Yoshiyuki Tanaka on 2018/01/30.
//  Copyright 2018 yoshiyuki tanaka. All rights reserved.
//

import UIKit

extension UIView {
    func applyAllEdgeEqualToSuperView() {
        guard let superview = superview  else { return }

        translatesAutoresizingMaskIntoConstraints = false

        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0).isActive = true
    }
}
