//
//  GithubAPITests.swift
//  UnitTestSampleTests
//
//  Created by Yoshiyuki Tanaka on 2018/01/30.
//  Copyright 2018 yoshiyuki tanaka. All rights reserved.
//

import Foundation
import XCTest
import OHHTTPStubs
import APIKit

@testable import UnitTestSample

class GitHubUserAPITests: XCTestCase {
    override func setUp() {
        _ = stub(condition: isPath("/users/yopicpic")) { _ in
            let stubPath = OHPathForFile("user.json", type(of: self))
            return fixture(filePath: stubPath!, headers: nil)
        }
    }

    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
    }

    func testプロフィール取得の成功() {
        let expectation = XCTestExpectation(description: "get my profile")

        Session.send(GithubUserAPI.GetMyProfile()) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.name, "yopi")
                XCTAssertEqual(response.location, "Tokyo, Japan")
                XCTAssertEqual(response.imageURL, "http://dummy.co.jp/a.png")

                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }

        wait(for: [expectation], timeout: 10.0)
    }
}
