//
//  MyTFGUser.swift
//  MyTFG
//
//  Created by Jakob Handke on 17.12.21.
//

import Foundation
import UIKit

struct MyTFGUser: Codable {
    private var username: String
    private var id: String
    private var type: String
    private var firstname: String
    private var lastname: String
    private var grade: String
    private var usertype: String
    private var rank: String
    private var mail: String
    private var avatar: String
    private var shortage: String
    private var rights: Int

    init(username: String, id: String, type: String, firstname: String, lastname: String, grade: String,
         usertype: String, rank: String, mail: String, avatar: String, shortage: String, rights: Int) {
        self.username = username
        self.id = id
        self.type = type
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.grade = grade
        self.usertype = usertype
        self.rank = rank
        self.mail = mail
        self.avatar = avatar
        self.shortage = shortage
        self.rights = rights
    }

    init(from userModel: UserModel) {
        self.username = userModel.username
        self.id = userModel.id
        self.type = userModel.type
        self.firstname = userModel.firstname
        self.lastname = userModel.lastname
        self.grade = userModel.grade
        self.usertype = userModel.usertype
        self.rank = userModel.rank
        self.mail = userModel.mail
        self.avatar = userModel.avatar
        self.shortage = userModel.shortage
        self.rights = userModel.rights
    }

    var getUsername: String {
        return self.username
    }

    var getFirstName: String {
        return self.firstname
    }

    var getLastName: String {
        return self.lastname
    }

    var getGrade: String {
        return self.grade
    }

    var getDevice: String {
    #if os(iOS)
        return UIDevice.current.identifierForVendor!.uuidString
    #elseif os(watchOS)
        return "Apple Watch"
    #else
        return "unknown OS"
    #endif
    }

    var avatarURL: URL? {
        return URL(string: "https://mytfg.de/\(avatar)")
    }
}
