//
//  EventRepository.swift
//  MyTFG
//
//  Created by Jakob Handke on 20.09.21.
//

import Foundation

struct EventsAPIResponse: APIResponse {
    var status: Int
    var message: String
    var apicode: Int

    var events: [EventModel]

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case apicode
        case events = "stripped_events"
    }
}
