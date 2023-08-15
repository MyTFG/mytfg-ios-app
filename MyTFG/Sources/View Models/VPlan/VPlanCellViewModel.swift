//
//  VPlanCellViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 04.11.21.
//

import Foundation

class VPlanCellViewModel: ObservableObject, Identifiable, CustomStringConvertible {
    private let entry: VPlanEntry

    var isAdditional: Bool

    init(entry: VPlanEntry) {
        self.entry = entry
        self.isAdditional = false
    }

    init(entry: VPlanEntry, isAdditional: Bool) {
        self.entry = entry
        self.isAdditional = isAdditional
    }

    var getLesson: String {
        return entry.lesson
    }

    var getClass: String {
        return entry.cls
    }

    var getPlan: String {
        return entry.plan
    }

    var getSubstitution: String {
        return entry.substitution
    }

    var getComment: String {
        return entry.comment
    }

    var hasComment: Bool {
        return entry.comment != ""
    }

    var hasSubstitution: Bool {
        return entry.substitution != ""
    }

    var description: String {
        return """
            Lesson: \(getLesson),
            Class: \(getClass),
            Plan: \(getPlan),
            Subst: \(getSubstitution)
            """
    }
}
