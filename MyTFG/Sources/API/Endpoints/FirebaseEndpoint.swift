//
//  FirebaseEndpoint.swift
//  MyTFG
//
//  Created by Jakob Handke on 24.02.22.
//

import Foundation

enum FirebaseEndpoint {
    case pushFirebaseToken(account: MyTFGAccount, token: String)
    case getVPlanClasses(account: MyTFGAccount)
    case updateFirebaseAbos(account: MyTFGAccount, abos: String)
}

extension FirebaseEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .pushFirebaseToken(let account, let token):
            guard let url = URL(string: "https://mytfg.de/api_firebase_token") else {
                preconditionFailure("Invalid URL format for pushFirebaseToken")
            }
            var request = URLRequest(url: url)
            request.encodeParameters(account.authParameters(merge: ["push_token": token, "service": "applefb"]))
            return request

        case .getVPlanClasses(let account):
            guard let url = URL(string: "https://mytfg.de/api_vplan_classes") else {
                preconditionFailure("Invalid URL format for getVPlanClasses")
            }
            var request = URLRequest(url: url)
            request.encodeParameters(account.authParameters)
            return request

        case .updateFirebaseAbos(let account, let abos):
            guard let url = URL(string: "https://mytfg.de/api_firebase_abo") else {
                preconditionFailure("Invalid URL format for updateFirebaseAbos")
            }
            var request = URLRequest(url: url)
            request.encodeParameters(account.authParameters(merge: ["abos": abos]))
            return request
        }
    }
}
