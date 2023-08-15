//
//  KeychainWrapper.swift
//  MyTFG
//
//  Created by Jakob Handke on 05.11.21.
//

import Foundation
import KeychainAccess

class KeychainWrapper {
    private let keychain = Keychain(service: "de.mytfg.ios")

    private func setValue(_ value: String, for key: KeychainWrapperKey) throws {
        try keychain.set(value, key: key.rawValue)
    }

    private func getValue(for key: KeychainWrapperKey) -> String? {
        return try? keychain.getString(key.rawValue)
    }

    private func removeValue(for key: KeychainWrapperKey) throws {
        try keychain.remove(key.rawValue)
    }

    private func valueExists(for key: KeychainWrapperKey) -> Bool {
        return keychain.allKeys().contains(key.rawValue)
    }

    func getToken() -> String? {
        return getValue(for: .mytfgAuthToken)
    }

    func setToken(_ token: String) throws {
        try setValue(token, for: .mytfgAuthToken)
    }

    func tokenExists() -> Bool {
        return valueExists(for: .mytfgAuthToken)
    }

    func removeToken() throws {
        try removeValue(for: .mytfgAuthToken)
    }

    func getExpires() -> Int? {
        guard let expires = getValue(for: .mytfgAuthTokenExpires) else {
            return 0
        }
        return Int(expires)
    }

    func setExpires(_ expires: Int) throws {
        try setValue(String(expires), for: .mytfgAuthTokenExpires)
    }
}
