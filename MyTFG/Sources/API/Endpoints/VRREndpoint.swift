//
//  VrrEndpoint.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import Foundation

enum VRREndpoint {
    case vrrList
}

extension VRREndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .vrrList:
            guard let url = URL(string: "https://mytfg.de/api_vrr_get") else {
                preconditionFailure("Invalid URL format for vrrList")
            }

            let request = URLRequest(url: url)
            return request
        }
    }
}
