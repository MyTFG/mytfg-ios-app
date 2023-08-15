//
//  EventModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 20.09.21.
//

import Foundation

struct EventModel: Codable, Identifiable {
    let id = UUID()

    var title: String
    var description: String
    var startTimestamp: Int
    var endTimestamp: Int

    enum CodingKeys: String, CodingKey {
        case title
        case description = "stripped_description"
        case startTimestamp = "startts"
        case endTimestamp = "endts"
    }
}
