//
//  UserRepository.swift
//  UnitTestSample
//
//  Created by Yoshiyuki Tanaka on 2018/01/30.
//  Copyright © 2018年 yoshiyuki tanaka. All rights reserved.
//

import Foundation
import RealmSwift

protocol UserRepositoryProtocol {
    func getMyProfile() -> User?
    func createOrUpdateMyProfile(_ user: User)
}

class UserRepository: UserRepositoryProtocol {
    func getMyProfile() -> User? {
        return try! Realm().objects(User.self).first
    }

    func createOrUpdateMyProfile(_ user: User) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(user, update: true)
        }
    }
}
