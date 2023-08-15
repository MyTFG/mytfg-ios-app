//
//  FirebaseService.swift
//  MyTFG
//
//  Created by Jakob Handke on 24.02.22.
//

import Foundation
import Combine

protocol FirebaseService {
    var apiSession: APIService { get }
    var secretService: SecretService { get }

    func sendFirebaseToken(token: String) -> AnyPublisher<FirebaseTokenResponse, APIError>
    func getAvailableClasses() -> AnyPublisher<AvailableClassesResponse, APIError>
    func updateFirebaseAbos(abos: Set<String>) -> AnyPublisher<FirebaseAboResponse, APIError>
}

extension FirebaseService {
    func sendFirebaseToken(token: String) -> AnyPublisher<FirebaseTokenResponse, APIError> {
        guard let account = secretService.retrieveAccount() else {
            return Fail(error: .noCredentialsAvailable)
                .eraseToAnyPublisher()
        }
        return apiSession.request(with: FirebaseEndpoint.pushFirebaseToken(account: account, token: token))
            .eraseToAnyPublisher()
    }

    func getAvailableClasses() -> AnyPublisher<AvailableClassesResponse, APIError> {
        guard let account = secretService.retrieveAccount() else {
            return Fail(error: .noCredentialsAvailable)
                .eraseToAnyPublisher()
        }
        return apiSession.request(with: FirebaseEndpoint.getVPlanClasses(account: account))
            .eraseToAnyPublisher()
    }

    func updateFirebaseAbos(abos: Set<String>) -> AnyPublisher<FirebaseAboResponse, APIError> {
        guard let account = secretService.retrieveAccount() else {
            return Fail(error: .noCredentialsAvailable)
                .eraseToAnyPublisher()
        }
        let abosString = abos.joined(separator: ";")
        return apiSession.request(with: FirebaseEndpoint.updateFirebaseAbos(account: account, abos: abosString))
            .eraseToAnyPublisher()
    }
}
