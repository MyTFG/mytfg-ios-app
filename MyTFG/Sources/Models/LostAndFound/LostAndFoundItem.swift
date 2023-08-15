//
//  LostAndFoundItem.swift
//  MyTFG
//
//  Created by Jakob Handke on 10.12.21.
//

import Foundation

struct LostAndFoundItem: Codable {
    var id: Int
    var properties: LostAndFoundItemProperties

    enum CodingKeys: String, CodingKey {
        case id
        case properties
    }
}
