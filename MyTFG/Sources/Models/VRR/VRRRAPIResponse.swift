//
//  VRRRepository.swift
//  MyTFG
//
//  Created by Jakob Handke on 21.09.21.
//

import Foundation

struct VRRRAPIResponse: APIResponse {
    var status: Int
    var message: String
    var apicode: Int

    var vrr: VRRData
}
