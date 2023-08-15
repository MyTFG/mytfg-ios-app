//
//  LostAndFoundService.swift
//  MyTFG
//
//  Created by Jakob Handke on 10.12.21.
//

import Foundation
import Combine

protocol LostAndFoundService {
    var apiSession: APIService {get}
    func getLostAndFoundList() -> AnyPublisher<LostAndFoundAPIResponse, APIError>
}

extension LostAndFoundService {
    func getLostAndFoundList() -> AnyPublisher<LostAndFoundAPIResponse, APIError> {
        return apiSession.request(with: LostAndFoundEndpoint.getLostAndFoundList)
            .eraseToAnyPublisher()
    }
}
