//
//  LoginService.swift
//  MyTFG
//
//  Created by Jakob Handke on 28.09.21.
//

import Foundation
import Combine

protocol AuthenticationService {
    var apiSession: APIService { get }
    var secretService: SecretService { get }

    func login(username: String, password: String) -> AnyPublisher<UserAPIResponse, APIError>
    func logout() -> AnyPublisher<UserLogoutResponse, APIError>
    func getAuthList() -> AnyPublisher<SessionAPIResponse, APIError>
    func removeSession(device: String) -> AnyPublisher<CurrentUserAPIResponse, APIError>
}

extension AuthenticationService {
    func login(username: String, password: String) -> AnyPublisher<UserAPIResponse, APIError> {
        return apiSession.request(with: AuthenticationEndpoint.login(username: username, password: password))
            .eraseToAnyPublisher()
    }

    func logout() -> AnyPublisher<UserLogoutResponse, APIError> {
        guard let account = secretService.retrieveAccount() else {
            return Fail(error: .noCredentialsAvailable)
                .eraseToAnyPublisher()
        }
        return apiSession.request(with: AuthenticationEndpoint.logout(account: account))
            .eraseToAnyPublisher()
    }

    func getAuthList() -> AnyPublisher<SessionAPIResponse, APIError> {
        guard let account = secretService.retrieveAccount() else {
            return Fail(error: .noCredentialsAvailable)
                .eraseToAnyPublisher()
        }
        return apiSession.request(with: AuthenticationEndpoint.authList(account: account))
            .eraseToAnyPublisher()
    }

    func removeSession(device: String) -> AnyPublisher<CurrentUserAPIResponse, APIError> {
        guard let account = secretService.retrieveAccount() else {
            return Fail(error: .noCredentialsAvailable)
                .eraseToAnyPublisher()
        }
        return apiSession.request(with: AuthenticationEndpoint.authRemove(account: account, device: device))
            .eraseToAnyPublisher()
    }
}
