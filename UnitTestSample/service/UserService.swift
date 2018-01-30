//
//  UserService.swift
//  UnitTestSample
//
//  Created by Yoshiyuki Tanaka on 2018/01/30.
//  Copyright 2018 yoshiyuki tanaka. All rights reserved.
//

import Foundation
import Result
import APIKit

protocol UserServiceProtocol {
    func getCacheProfile() -> User?
    func getProfile(_ handler: @escaping (Result<User, SessionTaskError>) -> Void)
}

class UserService: UserServiceProtocol {
    private let userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol = UserRepository()) {
        self.userRepository = userRepository
    }

    func getCacheProfile() -> User? {
        return userRepository.getMyProfile()
    }

    func getProfile(_ handler: @escaping (Result<User, SessionTaskError>) -> Void) {
        let request = GithubUserAPI.GetMyProfile()
        Session.shared.send(request) { [weak self] result in
            switch result {
            case .success(let user):
                self?.userRepository.createOrUpdateMyProfile(user)
                handler(Result.success(user))
            case .failure(let error):
                handler(Result.failure(error))
            }
        }
    }
}
