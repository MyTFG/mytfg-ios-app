//
//  APICombineSession.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import Foundation
import Combine

struct APISession: APIService {
    func request<Model>(with builder: RequestBuilder) -> AnyPublisher<Model, APIError> where Model: Decodable {
        let decoder = JSONDecoder()

        return URLSession.shared
            .dataTaskPublisher(for: builder.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { (networkError: URLError) -> APIError in
                if networkError.code == .notConnectedToInternet {
                    return .networkUnavailable
                }
                return .other(networkError)
            }
            .flatMap { data, response -> AnyPublisher<Model, APIError> in
                if let response = response as? HTTPURLResponse {
                    switch response.statusCode {
                    case (200...299):
                        return Just(data)
                            .decode(type: Model.self, decoder: decoder)
                            .mapError { error in .decodingError(error) }
                            .eraseToAnyPublisher()
                    case 403:
                        return Fail(error: APIError.noPermission)
                            .eraseToAnyPublisher()
                    case (400...499):
                        return Fail(error: APIError.clientError)
                            .eraseToAnyPublisher()
                    case (500...599):
                        return Fail(error: APIError.serverError)
                            .eraseToAnyPublisher()
                    default:
                        return Fail(error: APIError.unknown)
                            .eraseToAnyPublisher()
                    }
                }
                return Fail(error: APIError.unknown)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
