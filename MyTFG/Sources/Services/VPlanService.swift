//
//  VPlanService.swift
//  MyTFG
//
//  Created by Jakob Handke on 04.11.21.
//

import Foundation
import Combine

protocol VPlanService {
    var apiSession: APIService { get }
    var secretService: SecretService { get }

    func getVPlanList(day: VPlanDay) -> AnyPublisher<VPlanAPIResponse, APIError>
}

extension VPlanService {
    func getVPlanList(day: VPlanDay) -> AnyPublisher<VPlanAPIResponse, APIError> {
        guard let account = secretService.retrieveAccount() else {
            return Fail(error: APIError.noCredentialsAvailable)
                .eraseToAnyPublisher()
        }
        return apiSession.request(with: VPlanEndpoint.vplanList(day: day, account: account))
    }
}
