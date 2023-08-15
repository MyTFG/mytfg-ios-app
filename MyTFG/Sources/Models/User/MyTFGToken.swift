//
//  MyTFGToken.swift
//  MyTFG
//
//  Created by Jakob Handke on 18.12.21.
//

import Foundation

struct MyTFGToken: Codable {
    private let token: String
    private let expires: Int

    init(token: String, expires: Int) {
        self.token = token
        self.expires = expires
    }

    var getTokenString: String {
        return token
    }

    var getExpires: Int {
        return expires
    }
}
