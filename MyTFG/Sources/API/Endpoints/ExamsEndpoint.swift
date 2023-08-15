//
//  ExamsEndpoint.swift
//  MyTFG
//
//  Created by Jakob Handke on 01.03.22.
//

import Foundation

enum ExamsEndpoint {
    case examsList
}

extension ExamsEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .examsList:
            guard let url = URL(string: "https://mytfg.de/api_exams_linear") else {
                preconditionFailure("Invalid URL format for examsList")
            }

            let request = URLRequest(url: url)
            return request
        }
    }
}
