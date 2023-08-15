//
//  FirebaseTokenResponse.swift
//  MyTFG
//
//  Created by Jakob Handke on 23.02.22.
//

import Foundation

struct FirebaseTokenResponse: APIResponse {
    let status: Int
    let message: String
    let apiCode: Int
    let log: [String]
    let pushToken: String
    let service: String
    let currentUser: UserModel

    enum CodingKeys: String, CodingKey {
        case status, message
        case apiCode = "apicode"
        case log
        case pushToken = "push_token"
        case service
        case currentUser = "currentuser"
    }
}
