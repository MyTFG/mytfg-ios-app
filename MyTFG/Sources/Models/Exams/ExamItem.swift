//
//  ExamItem.swift
//  MyTFG
//
//  Created by Jakob Handke on 17.01.22.
//

import Foundation

struct ExamItem: Codable {
    let block: String?
    let subject: String?
    let teacher: String?
    let lessons: String?
    let crossed: Bool?
    let lines: [String]?
    let type: String
    let date: String
    let timestamp: Int
    let grade: Int
}
