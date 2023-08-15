//
//  ExamCellViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 01.03.22.
//

import Foundation

class ExamCellViewModel: ObservableObject, Identifiable {
    private let examItem: ExamItem

    private var _day: String = ""
    private var _dayOfWeek: String = ""
    private var _month: String = ""

    init(_ item: ExamItem) {
        self.examItem = item
        self.assembleDateFields()
    }

    private func assembleDateFields() {
        let formatter = CustomDateFormatter(timestamp: examItem.timestamp)
        self._day = formatter.getDay()
        self._dayOfWeek = formatter.getDayOfWeek()
        self._month = formatter.getMonth()
    }

    var day: String {
        return self._day
    }

    var dayOfWeek: String {
        return self._dayOfWeek.replacingOccurrences(of: ".", with: "").uppercased()
    }

    var month: String {
        return self._month.replacingOccurrences(of: ".", with: "").uppercased()
    }

    var block: String {
        return examItem.block ?? ""
    }

    var subject: String {
        return examItem.subject ?? ""
    }

    var teacher: String {
        return examItem.teacher ?? ""
    }

    var lessons: String {
        return examItem.lessons ?? ""
    }

    var crossed: Bool {
        return examItem.crossed ?? false
    }

    var type: ExamItemType {
        switch examItem.type {
        case "entry":
            return .entry
        case "spanned":
            return .spanned
        default:
            return .entry
        }
    }

    var spannedText: String {
        if var lines = examItem.lines {
            lines.removeAll(where: { $0 == "" })
            return lines.joined(separator: ", ")
        }
        return ""
    }
}
