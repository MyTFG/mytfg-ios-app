//
//  UserModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 05.11.21.
//

import Foundation

struct UserModel: Codable {
    let id: String
    let type: String
    let username: String
    let firstname: String
    let lastname: String
    let grade: String
    let usertype: String
    let rank: String
    let mail: String
    let avatar: String
    let shortage: String
    let isOnline: Bool
    let rights: Int
//    let permissions: [Permission]?
}
