//
//  User.swift
//  UnitTestSample
//
//  Created by Yoshiyuki Tanaka on 2018/01/30.
//  Copyright 2018 yoshiyuki tanaka. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class User: Object, Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "avatar_url"
        case location
    }

    dynamic var id: Int = 0
    dynamic var name = ""
    dynamic var imageURL: String?
    dynamic var location: String?

    override static func primaryKey() -> String? {
        return "id"
    }
}
