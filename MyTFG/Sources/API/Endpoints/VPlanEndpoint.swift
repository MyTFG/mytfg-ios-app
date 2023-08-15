//
//  VPlanEndpoint.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import Foundation

enum VPlanEndpoint {
    case vplanList(day: VPlanDay, account: MyTFGAccount)
}

extension VPlanEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .vplanList(let day, let account):
            guard let url = URL(string: "https://mytfg.de/api_vplan_get") else {
                preconditionFailure("Invalid URL format for vplanList")
            }

            let additionalClasses = AppSettings.shared.selectedAdditionalClasses

            var request = URLRequest(url: url)
            request.encodeParameters(
                account.authParameters(
                    merge: ["day": day.rawValue, "additionals": additionalClasses.joined(separator: ",")]))
            return request
        }
    }
}
