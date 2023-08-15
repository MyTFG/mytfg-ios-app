//
//  VPlanData.swift
//  MyTFG
//
//  Created by Jakob Handke on 04.11.21.
//

import Foundation

struct VPlanData: Codable {
    var dayArgument: String
    var dayString: String
    var day: String
    var mode: Int
    var classString: String
    var status: Int
    var date: String
    var dateString: String
    var dateTimestamp: Int
//    var statusMessage: String manchmal Bool
    var changed: AnyCodableValue? // fast immer String, manchmal Int
//    var timestamp: Int fehlt manchmal
    var marquee: [String]
    var absentTeachers: [String]
    var absentLessons: [String]

    var entries: [VPlanEntry]
    var additionalEntries: [VPlanEntry]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dayArgument = try container.decode(String.self, forKey: .dayArgument)
        self.dayString = try container.decode(String.self, forKey: .dayString)
        self.day = try container.decode(String.self, forKey: .day)
        self.mode = try container.decode(Int.self, forKey: .mode)
        self.classString = try container.decode(String.self, forKey: .classString)
        self.status = try container.decode(Int.self, forKey: .status)
        self.date = try container.decode(String.self, forKey: .date)
        self.dateString = try container.decode(String.self, forKey: .dateString)
        self.dateTimestamp = try container.decode(Int.self, forKey: .dateTimestamp)
        self.changed = try container.decodeIfPresent(AnyCodableValue.self, forKey: .changed)
        self.marquee = try container.decode([String].self, forKey: .marquee)
        self.absentTeachers = try container.decode([String].self, forKey: .absentTeachers)
        self.absentLessons = try container.decode([String].self, forKey: .absentLessons)
        self.entries = try container.decode([VPlanEntry].self, forKey: .entries)
        self.additionalEntries = try container.decode([VPlanEntry].self, forKey: .additionalEntries)
    }

    enum CodingKeys: String, CodingKey {
        case dayArgument = "day_arg"
        case dayString = "day_str"
        case day
        case mode
        case classString = "class_str"
        case status
        case date
        case dateString = "datestr"
        case dateTimestamp = "dateTS"
//        case statusMessage = "status_message"
        case changed
//        case timestamp
        case marquee
        case absentTeachers = "absent_teachers"
        case absentLessons = "absent_lessons"
        case entries
        case additionalEntries = "additional_entries"
    }
}
