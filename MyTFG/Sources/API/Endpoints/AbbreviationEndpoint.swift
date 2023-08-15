//
//  AbbreviationEndpoint.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import Foundation

enum AbbreviationEndpoint {
    case abbreviationList(type: AbbreviationType)
}

extension AbbreviationEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .abbreviationList(let type):
            guard let url = URL(string: "https://mytfg.de/api_abbreviation_\(type.rawValue)") else {
                preconditionFailure("Invalid URL format for getAbbreviationList")
            }
            let request = URLRequest(url: url)
            return request
        }
    }
}
