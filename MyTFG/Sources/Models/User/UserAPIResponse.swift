//
//  UserRepository.swift
//  MyTFG
//
//  Created by Jakob Handke on 05.11.21.
//

import Foundation

struct UserAPIResponse: APIResponse {
    let status: Int
    let message: String
    let apiCode: Int
    let log: [String]
    let user: UserModel
    let token: String
    let deviceName: String
    let device: String
    let username: String
    let expires: Int
    let currentUser: UserModel

    enum CodingKeys: String, CodingKey {
        case status, message
        case apiCode = "apicode"
        case log, user, token
        case deviceName = "devicename"
        case device, username, expires
        case currentUser = "currentuser"
    }
}
