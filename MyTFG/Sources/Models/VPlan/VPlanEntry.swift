//
//  VPlanEntry.swift
//  MyTFG
//
//  Created by Jakob Handke on 04.11.21.
//

import Foundation

struct VPlanEntry: Codable {
    var id: String
    var cls: String
    var lesson: String
    var plan: String
    var substitution: String
    var comment: String
    var date: String
    var lastUpdate: String
    var teacher: String
    var substitutionTeacher: String
    var planTeacherName: String
    var planSubjectName: String
    var shortage: String
    var planRoom: String
    var substitutionTeacherName: String
    var substitutionSubjectName: String
    var substitutionRoom: String
    var planText: String
    var substitutionText: String
    var version: String
    var teachers: String
    var teacherOnly: String
    var color: String

    enum CodingKeys: String, CodingKey {
        case id
        case cls = "class"
        case lesson
        case plan
        case substitution
        case comment
        case date
        case lastUpdate = "lastupdate"
        case teacher
        case substitutionTeacher = "substitution_teacher"
        case planTeacherName = "plan_teacher_name"
        case planSubjectName = "plan_subject_name"
        case shortage
        case planRoom = "plan_room"
        case substitutionTeacherName = "subst_teacher_name"
        case substitutionSubjectName = "subst_subject_name"
        case substitutionRoom = "subst_room"
        case planText = "plan_text"
        case substitutionText = "subst_text"
        case version
        case teachers
        case teacherOnly = "teacher_only"
        case color
    }
}
