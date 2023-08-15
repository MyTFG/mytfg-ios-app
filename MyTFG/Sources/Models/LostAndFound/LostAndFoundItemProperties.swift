//
//  LostAndFoundItemProperties.swift
//  MyTFG
//
//  Created by Jakob Handke on 10.12.21.
//

import Foundation

struct LostAndFoundItemProperties: Codable {
    var description: String
    var registerDateTimestamp: Int
    var registerDate: String

    enum CodingKeys: String, CodingKey {
        case description
        case registerDateTimestamp = "registerdateTS"
        case registerDate = "registerdate"
    }
}
