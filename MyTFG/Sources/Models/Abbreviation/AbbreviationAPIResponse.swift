//
//  AbbreviationRepository.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import Foundation

struct AbbreviationAPIResponse: APIResponse {
    var status: Int
    var message: String
    var apiCode: Int

    var teachers: [Abbreviation]?
    var subjects: [Abbreviation]?

    enum CodingKeys: String, CodingKey {
        case status, message
        case apiCode = "apicode"
        case teachers, subjects
    }
}
