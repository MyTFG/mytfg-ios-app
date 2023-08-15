//
//  VRRModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 23.09.21.
//

import Foundation

struct VRRModel: Codable {
    var scheduled: String
    var real: String
    var delay: Int
    var arrival: String
    var type: String
    var destination: String
    var line: String
    var route: [String]

    enum CodingKeys: String, CodingKey {
        case scheduled = "sched"
        case real
        case delay
        case arrival
        case type
        case destination
        case line
        case route
    }
}
