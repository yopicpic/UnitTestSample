//
//  UserRepositoryTests.swift
//  UnitTestSampleTests
//
//  Created by Yoshiyuki Tanaka on 2018/01/30.
//  Copyright 2018 yoshiyuki tanaka. All rights reserved.
//

import Foundation
import XCTest
import RealmSwift
@testable import UnitTestSample


class UserRepositoryTests: XCTestCase {
    override func setUp() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }

    func tests保存と取得() {
        // セットアップ
        let user = User()
        user.id = 100
        let repository = UserRepository()

        // 実行
        repository.createOrUpdateMyProfile(user)

        // 結果
        let result = repository.getMyProfile()
        XCTAssertEqual(result?.id, 100)
    }
}
