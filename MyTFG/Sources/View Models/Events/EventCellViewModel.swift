//
//  EventCellViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 20.09.21.
//

import Foundation

class EventCellViewModel: ObservableObject, Identifiable {
    private let event: EventModel

    private let dayOfWeek: String
    private let day: String
    private let month: String
    private let year: String

    init(_ event: EventModel) {
        self.event = event

        let formatter = CustomDateFormatter(timestamp: event.startTimestamp)
        self.dayOfWeek = formatter.getDayOfWeek()
        self.day = formatter.getDay()
        self.month = formatter.getMonth()
        self.year = formatter.getYear()
    }

    var getTitle: String {
        return event.title
    }

    var hasText: Bool {
        return getText != ""
    }

    var getText: String {
        return event.description
    }

    var getDayOfWeek: String {
        return dayOfWeek.replacingOccurrences(of: ".", with: "").uppercased()
    }

    var getDay: String {
        return day
    }

    var getMonth: String {
        return month.replacingOccurrences(of: ".", with: "").uppercased()
    }

    var getYear: String {
        return year
    }
}
