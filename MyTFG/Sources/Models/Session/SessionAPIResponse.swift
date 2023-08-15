//
//  SessionAPIResponse.swift
//  MyTFG
//
//  Created by Jakob Handke on 17.12.21.
//

import Foundation

struct SessionAPIResponse: APIResponse {
    var status: Int
    var message: String
    var apiCode: Int

    var activeSessions: [SessionItemModel]
    var timedOutSessions: [SessionItemModel]

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case apiCode = "apicode"
        case activeSessions = "active"
        case timedOutSessions = "timedout"
    }
}
