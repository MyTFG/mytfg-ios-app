//
//  LostAndFoundEndpoint.swift
//  MyTFG
//
//  Created by Jakob Handke on 10.12.21.
//

import Foundation

enum LostAndFoundEndpoint {
    case getLostAndFoundList
}

extension LostAndFoundEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        guard let url = URL(string: "https://mytfg.de/api_lostandfound_list") else {
            preconditionFailure("Invalid URL format for getLostAndFoundList")
        }

        let request = URLRequest(url: url)
        return request
    }
}
