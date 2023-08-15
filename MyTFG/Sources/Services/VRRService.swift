//
//  VRRService.swift
//  MyTFG
//
//  Created by Jakob Handke on 27.09.21.
//

import Foundation
import Combine

protocol VRRService {
    var apiSession: APIService {get}
    func getVRRList() -> AnyPublisher<VRRRAPIResponse, APIError>
}

extension VRRService {
    func getVRRList() -> AnyPublisher<VRRRAPIResponse, APIError> {
        return apiSession.request(with: VRREndpoint.vrrList)
            .eraseToAnyPublisher()
    }
}
