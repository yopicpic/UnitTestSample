//
//  GithubUserAPI.swift
//  UnitTestSample
//
//  Created by Yoshiyuki Tanaka on 2018/01/30.
//  Copyright 2018 yoshiyuki tanaka. All rights reserved.
//

import Foundation
import APIKit
import RealmSwift
import Realm

struct GithubUserAPI {
    struct GetMyProfile: Request {
        var baseURL: URL { return URL(string: "https://api.github.com/")! }

        typealias Response = User

        var method: HTTPMethod { return .get }

        // プロフィールを取得するユーザーを変える場合はここを修正
        var path: String { return "users/yopicpic" }

        var parameters: Any? { return nil }

        // レスポンスをData型で返す必要がある
        //　https://qiita.com/sgr-ksmt/items/e822a379d41462e05e0d
        var dataParser: DataParser { return DecodableDataParser() }

        func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
            guard let data = object as? Data else {
                throw ResponseError.unexpectedObject(object)
            }

            return try JSONDecoder().decode(User.self, from: data)
        }
    }
}

class DecodableDataParser: DataParser {
    var contentType: String? { return "application/json" }

    func parse(data: Data) throws -> Any { return data }
}

