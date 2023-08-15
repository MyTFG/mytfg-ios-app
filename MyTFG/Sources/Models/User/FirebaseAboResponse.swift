//
//  FirebaseAboResponse.swift
//  MyTFG
//
//  Created by Jakob Handke on 24.02.22.
//

import Foundation

struct FirebaseAboResponse: APIResponse {
    let status: Int
    let message: String
    let apiCode: Int
    let log: [String]
    let abos: String
    let currentUser: UserModel

    enum CodingKeys: String, CodingKey {
        case status, message
        case apiCode = "apicode"
        case log
        case abos
        case currentUser = "currentuser"
    }
}
