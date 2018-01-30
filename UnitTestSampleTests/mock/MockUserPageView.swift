//
//  MockUserPageView.swift
//  UnitTestSampleTests
//
//  Created by Yoshiyuki Tanaka on 2018/01/30.
//  Copyright 2018 yoshiyuki tanaka. All rights reserved.
//

import Foundation

@testable import UnitTestSample

class MockUserPageView: UserPageView {
    var iconURL = ""
    var name = ""
    var location = ""
    var isErrorViewShown = false
    var isIndicatorShown = false
    var isErrorViewHidden = false
    var isIndicatorHidden = false

    func showIcon(url: String) {
        iconURL = url
    }

    func showName(name: String) {
        self.name = name
    }

    func showLocation(location: String) {
        self.location = location
    }

    func showErrorView() {
        isErrorViewShown = true
    }

    func showIndicator() {
        isIndicatorShown = true
    }

    func hideErrorView() {
        isErrorViewHidden = true
    }

    func hideIndicator() {
        isIndicatorHidden = true
    }
}
