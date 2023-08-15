//
//  VPlanRepository.swift
//  MyTFG
//
//  Created by Jakob Handke on 04.11.21.
//

import Foundation

struct VPlanAPIResponse: APIResponse {
    var status: Int
    var message: String
    var apiCode: Int
    var planData: VPlanData

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case apiCode = "apicode"
        case planData = "plan"
    }
}
