//
//  Permission.swift
//  MyTFG
//
//  Created by Jakob Handke on 05.11.21.
//

import Foundation

struct Permission: Codable {
    let permission: String
    let inherited, explicit, revoked, total: Bool
    let permissionDescription: String

    enum CodingKeys: String, CodingKey {
        case permission = "perm"
        case inherited, explicit, revoked, total
        case permissionDescription = "description"
    }
}
