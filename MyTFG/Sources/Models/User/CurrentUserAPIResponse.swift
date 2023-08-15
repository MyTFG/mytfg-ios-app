//
//  CurrentUserAPIResponse.swift
//  MyTFG
//
//  Created by Jakob Handke on 15.01.22.
//

import Foundation

struct CurrentUserAPIResponse: APIResponse {
    let status: Int
    let message: String
    let apiCode: Int
    let currentUser: UserModel

    enum CodingKeys: String, CodingKey {
        case status, message
        case apiCode = "apicode"
        case currentUser = "currentuser"
    }
}
