//
//  APIService.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import Foundation
import Combine

protocol APIService {
    func request<Model: APIResponse>(with builder: RequestBuilder) -> AnyPublisher<Model, APIError>
}
