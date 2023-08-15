//
//  SessionItemViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 17.12.21.
//

import Foundation
import UIKit

class SessionItemViewModel: ObservableObject, Identifiable {
    internal var sessionItem: SessionItemModel

    init(_ sessionItem: SessionItemModel) {
        self.sessionItem = sessionItem
    }

    let id = UUID()

    var getDeviceName: String {
        return sessionItem.deviceName
    }

    var getTimeoutDate: String {
        return "\(sessionItem.timeoutDateString) Uhr"
    }

    var getDeviceDescription: String {
        return sessionItem.deviceInfo
    }

    var getLastUsed: String {
        return "\(sessionItem.lastUsedDateString.dashStripped) Uhr"
    }

    var isThisDevice: Bool {
        #if os(iOS)
            return sessionItem.device == UIDevice.current.identifierForVendor!.uuidString
        #else
            return false
        #endif
    }
}
