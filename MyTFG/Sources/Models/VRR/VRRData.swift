//
//  VRRData.swift
//  MyTFG
//
//  Created by Jakob Handke on 21.09.21.
//

import Foundation

struct VRRData: Codable {
    var error: String?
    var vrrEntries: [VRRModel]

    enum CodingKeys: String, CodingKey {
        case error
        case vrrEntries = "relevant"
    }
}
