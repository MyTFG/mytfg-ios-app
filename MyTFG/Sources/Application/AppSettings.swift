//
//  AppSettings.swift
//  MyTFG
//
//  Created by Jakob Handke on 29.09.21.
//

import Foundation
import Foil

final class AppSettings {
    static let shared = AppSettings()

    @WrappedDefault(key: .isLoggedIn, defaultValue: false)
    var isLoggedIn: Bool

    @WrappedDefaultOptional(key: .authUsername)
    var authUsername: String?

    @WrappedDefaultOptional(key: .authExpires)
    var authExpires: Int?

    @WrappedDefaultOptional(key: .mytfgUserData)
    var mytfgUserData: Data?

    @WrappedDefault(key: .selectedAdditionalClasses, defaultValue: [])
    var selectedAdditionalClasses: Set<String>
}
