//
//  CustomDateFormatter.swift
//  MyTFG
//
//  Created by Jakob Handke on 20.09.21.
//

import Foundation

class CustomDateFormatter {
    let dateFormatter = DateFormatter()
    let date: Date

    init(timestamp: Int) {
        self.date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        self.dateFormatter.locale = Locale(identifier: "de_DE")
    }

    init(date: String) {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.date = dateFormatter.date(from: date)!
    }

    func getVPlanDate() -> String {
        dateFormatter.dateFormat = "E, d. MMM"
        dateFormatter.locale = Locale(identifier: "de_DE")
        return dateFormatter.string(from: date)
    }

    func getLongVPlanDate() -> String {
        dateFormatter.dateFormat = "EEEE, d. MMMM"
        dateFormatter.locale = Locale(identifier: "de_DE")
        return dateFormatter.string(from: date)
    }

    func getDayOfWeek() -> String {
        dateFormatter.dateFormat = "EEEEEE"
        return dateFormatter.string(from: date)
    }

    func getDay() -> String {
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date)
    }

    func getMonth() -> String {
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: date)
    }

    func getYear() -> String {
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }

    func getLostAndFoundDate() -> String {
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
}
