//
//  MyTFGCredentials.swift
//  MyTFG
//
//  Created by Jakob Handke on 10.11.21.
//

import Foundation
import UIKit

class MyTFGAccount {
    private let user: MyTFGUser
    private let token: MyTFGToken

    /// Initializes MyTFGAccount from both underlying objects
    init(_ user: MyTFGUser, _ token: MyTFGToken) {
        self.user = user
        self.token = token
    }

    /// Initializes MyTFGAccount from `APIResponses`.
    /// - Parameters:
    ///  - userModel: `UserModel` from API
    ///  - tokenString: MyTFG authentication token from API
    ///  - tokenExpires: expire date (UNIX-timestamp) of token
    init(userModel: UserModel, tokenString: String, tokenExpires: Int) {
        user = MyTFGUser(from: userModel)
        token = MyTFGToken(token: tokenString, expires: tokenExpires)
    }

    /// Returns username, token and device identifier as dictionary for use in `URLRequest` headers.
    var authParameters: [String: String] {
        return [
            "mytfg_api_login_username": user.getUsername,
            "mytfg_api_login_token": token.getTokenString,
            "mytfg_api_login_device": UIDevice.current.identifierForVendor!.uuidString
        ]
    }

    /// Returns username, token and device identifier as dictionary for use in URLRequest headers and merges another
    /// dictionary for additional `URLRequest` headers into it.
    func authParameters(merge paramters: [String: String]) -> [String: String] {
        return authParameters.merging(paramters, uniquingKeysWith: { (current, _) in current })
    }

    /// Returns currently logged in `MyTFGUser`.
    var getMyTFGUser: MyTFGUser {
        return user
    }

    /// Returns MyTFG authentication token for currenty logged in `MyTFGUser`.
    var getMyTFGToken: MyTFGToken {
        return token
    }

    /// Returns `true`, if token expire date is in the future.
    /// Returns `false` otherwise.
    var isValid: Bool {
        return Date(timeIntervalSince1970: TimeInterval(token.getExpires)) > Date.now
    }
}
