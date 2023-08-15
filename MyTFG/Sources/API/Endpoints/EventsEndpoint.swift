//
//  EventsEndpoint.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import Foundation

enum EventsEndpoint {
    case eventList
}

extension EventsEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .eventList:
            guard let url = URL(string: "https://mytfg.de/api_tfg_events") else {
                preconditionFailure("Invalid URL format for eventList")
            }

            let request = URLRequest(url: url)
            return request
        }
    }
}
