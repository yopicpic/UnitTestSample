//
//  MockUserService.swift
//  UnitTestSampleTests
//
//  Created by Yoshiyuki Tanaka on 2018/01/30.
//  Copyright 2018 yoshiyuki tanaka. All rights reserved.
//

import Foundation
import APIKit
import Result
import RealmSwift

@testable import UnitTestSample

class MockUserService: UserServiceProtocol {
    var profileResult: Result<User, SessionTaskError>!
    var cacheProfile: User? = nil

    func getProfile(_ handler: @escaping (Result<User, SessionTaskError>) -> Void) {
        handler(profileResult)
    }

    func getCacheProfile() -> User? {
        return cacheProfile
    }
}

