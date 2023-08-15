//
//  ExamsAPIResponse.swift
//  MyTFG
//
//  Created by Jakob Handke on 17.01.22.
//

import Foundation

struct ExamsAPIResponse: APIResponse {
    let status: Int
    let message: String
    let apiCode: Int
    let exams: ExamsRepository

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case apiCode = "apicode"
        case exams
    }
}
