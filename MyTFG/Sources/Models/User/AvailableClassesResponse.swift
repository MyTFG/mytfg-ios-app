//
//  AvailableClassesResponse.swift
//  MyTFG
//
//  Created by Jakob Handke on 24.02.22.
//

import Foundation

struct AvailableClassesResponse: APIResponse {
    let status: Int
    let message: String
    let apiCode: Int
    let log: [String]
    let availableClasses: [String]
    let currentUser: UserModel

    enum CodingKeys: String, CodingKey {
        case status, message
        case apiCode = "apicode"
        case log
        case availableClasses = "extra_classes"
        case currentUser = "currentuser"
    }
}
