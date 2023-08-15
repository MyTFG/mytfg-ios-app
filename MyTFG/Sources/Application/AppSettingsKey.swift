//
//  AppSettingsKey.swift
//  MyTFG
//
//  Created by Jakob Handke on 29.09.21.
//

import Foundation
import Foil

enum AppSettingsKey: String, CaseIterable {
    case isLoggedIn
    case authUsername
    case authExpires
    case mytfgUserData
    case selectedAdditionalClasses
}

extension WrappedDefault {
    init(key: AppSettingsKey, defaultValue: T) {
        self.init(keyName: key.rawValue, defaultValue: defaultValue)
    }
}

extension WrappedDefaultOptional {
    init(key: AppSettingsKey) {
        self.init(keyName: key.rawValue)
    }
}
