//
//  EventService.swift
//  MyTFG
//
//  Created by Jakob Handke on 20.09.21.
//

import Foundation
import Combine

protocol EventService {
    var apiSession: APIService { get }
    func getEventList() -> AnyPublisher<EventsAPIResponse, APIError>
}

extension EventService {
    func getEventList() -> AnyPublisher<EventsAPIResponse, APIError> {
        return apiSession.request(with: EventsEndpoint.eventList)
            .eraseToAnyPublisher()
    }
}
