//
//  SessionItemModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 17.12.21.
//

import Foundation

struct SessionItemModel: Codable {
    var device: String
    var timeout: Int
    var timeoutDateString: String
    var timedOut: Bool
    var lastUsedTimestamp: Int
    var lastUsedDateString: String
    var deviceName: String
    var deviceOS: String
    var deviceOSVersion: String
    var deviceType: String
    var deviceInfo: String

    enum CodingKeys: String, CodingKey {
        case device, timeout
        case timeoutDateString = "timeout_date"
        case timedOut = "timedout"
        case lastUsedTimestamp = "lastused"
        case lastUsedDateString = "lastused_date"
        case deviceName = "devicename"
        case deviceOS = "deviceos"
        case deviceOSVersion = "deviceosversion"
        case deviceType = "devicetype"
        case deviceInfo = "deviceinfo"
    }
}
