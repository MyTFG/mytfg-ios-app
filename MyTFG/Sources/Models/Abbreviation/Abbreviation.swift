//
//  Abbreviation.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import Foundation

struct Abbreviation: Codable {
    var abbreviation: String
    var name: String

    enum CodingKeys: String, CodingKey {
        case abbreviation = "abbr"
        case name
    }
}
