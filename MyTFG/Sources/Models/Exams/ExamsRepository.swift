//
//  ExamsRepository.swift
//  MyTFG
//
//  Created by Jakob Handke on 17.01.22.
//

import Foundation

struct ExamsRepository: Codable {
    let title: String
    let entries: [String: [ExamItem]]
}
