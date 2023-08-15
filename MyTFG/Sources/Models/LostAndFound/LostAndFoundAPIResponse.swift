//
//  LostAndFoundRepository.swift
//  MyTFG
//
//  Created by Jakob Handke on 10.12.21.
//

import Foundation

struct LostAndFoundAPIResponse: APIResponse {
    var status: Int
    var message: String
    var apiCode: Int

    var items: [LostAndFoundItem]

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case apiCode = "apicode"
        case items = "elements"
    }
}
