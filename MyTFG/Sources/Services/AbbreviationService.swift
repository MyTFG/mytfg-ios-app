//
//  AbbreviationService.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import Foundation
import Combine

protocol AbbreviationService {
    var apiSession: APIService {get}
    func getAbbreviationList(_ type: AbbreviationType) -> AnyPublisher<AbbreviationAPIResponse, APIError>
}

extension AbbreviationService {
    func getAbbreviationList(_ type: AbbreviationType) -> AnyPublisher<AbbreviationAPIResponse, APIError> {
        return apiSession.request(with: AbbreviationEndpoint.abbreviationList(type: type))
            .eraseToAnyPublisher()
    }
}
