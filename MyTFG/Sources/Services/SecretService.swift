//
//  SecretService.swift
//  MyTFG
//
//  Created by Jakob Handke on 10.11.21.
//

import Foundation

class SecretService {
    private let keychain = KeychainWrapper()
    private let jsonEncoder = JSONEncoder()
    private let jsonDecoder = JSONDecoder()

    /// Saves MyTFGAccount to local storage
    /// MyTFGUser to AppSettings and MyTFGToken to keychain
    func saveAccount(_ account: MyTFGAccount) throws {
        let userInfoData = try jsonEncoder.encode(account.getMyTFGUser)
        AppSettings.shared.mytfgUserData = userInfoData

        try keychain.setToken(account.getMyTFGToken.getTokenString)
        try keychain.setExpires(account.getMyTFGToken.getExpires)
    }

    /// Retrieves MyTFGAccount from local storage
    /// MyTFGUser from AppSettings and MyTFGToken from keychain
    /// returns nil if MyTFGUser or MyTFGToken not present
    func retrieveAccount() -> MyTFGAccount? {
        if let userInfoData = AppSettings.shared.mytfgUserData,
           let mytfgUser = try? jsonDecoder.decode(MyTFGUser.self, from: userInfoData),
           let mytfgTokenString = keychain.getToken(),
           let mytfgTokenExpires = keychain.getExpires() {
            let mytfgToken = MyTFGToken(token: mytfgTokenString, expires: mytfgTokenExpires)
            return MyTFGAccount(mytfgUser, mytfgToken)
        }
        return nil
    }

    func deleteAccount() throws {
        AppSettings.shared.mytfgUserData = nil
        try keychain.removeToken()
    }

    func isLoggedIn() -> Bool {
        guard let account = retrieveAccount() else {
            return false
        }

        return account.isValid
    }
}
