//
//  ExamsService.swift
//  MyTFG
//
//  Created by Jakob Handke on 01.03.22.
//

import Foundation
import Combine

protocol ExamsService {
    var apiSession: APIService { get }
    func getExamsList() -> AnyPublisher<ExamsAPIResponse, APIError>
}

extension ExamsService {
    func getExamsList() -> AnyPublisher<ExamsAPIResponse, APIError> {
        return apiSession.request(with: ExamsEndpoint.examsList)
            .eraseToAnyPublisher()
    }
}
