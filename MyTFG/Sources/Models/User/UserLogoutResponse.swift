//
//  UserLogoutResponse.swift
//  MyTFG
//
//  Created by Jakob Handke on 13.01.22.
//

import Foundation

struct UserLogoutResponse: APIResponse {
    let status: Int
    let message: String
    let apiCode: Int
    let log: [String]

    enum CodingKeys: String, CodingKey {
        case status, message
        case apiCode = "apicode"
        case log
    }
}
