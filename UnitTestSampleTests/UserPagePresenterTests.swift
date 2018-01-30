//
//  UserPagePresenterTests.swift
//  UnitTestSampleTests
//
//  Created by Yoshiyuki Tanaka on 2018/01/30.
//  Copyright 2018 yoshiyuki tanaka. All rights reserved.
//

import XCTest
import Foundation
import Result

@testable import UnitTestSample

class UserPagePresenterTests: XCTestCase {
    func test正常にプロフィール取得() {
        // セットアップ
        let mockUserPageView = MockUserPageView()
        let mockUserService = MockUserService()

        let user = User()
        user.name = "yopi"
        user.imageURL = "http://dummy.co.jp/a.png"
        user.location = "Tokyo, Japan"
        mockUserService.profileResult = .success(user)
        let presenter = UserPagePresenter(view: mockUserPageView,
                                          userService: mockUserService)

        // 実行
        presenter.show()

        // 評価
        XCTAssertTrue(mockUserPageView.isIndicatorShown)
        XCTAssertEqual(mockUserPageView.name, "yopi")
        XCTAssertEqual(mockUserPageView.iconURL, "http://dummy.co.jp/a.png")
        XCTAssertEqual(mockUserPageView.location, "Tokyo, Japan")
        XCTAssertTrue(mockUserPageView.isIndicatorHidden)
    }
}

