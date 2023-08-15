//
//  NotificationService.swift
//  MyTFG
//
//  Created by Jakob Handke on 23.02.22.
//

import Foundation
import Combine

class NotificationService: FirebaseService {
    var apiSession: APIService
    var secretService: SecretService = SecretService()

    init(_ apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }

    var cancellables = Set<AnyCancellable>()

    func updateFirebaseToken(token: String) {
        if secretService.isLoggedIn() {
            DispatchQueue.global(qos: .background).async {
                self.sendFirebaseToken(token: token)
                    .sink(receiveCompletion: { result in
                        switch result {
                        case .failure(let error):
                            print("Handle error sendFirebaseToken: \(error)")
                        case .finished:
                            break
                        }
                    }, receiveValue: { apiResponse in
                        if apiResponse.apiCode == 200 {
                            print("uploading firebase token finished")
                        } else {
                            print("uploading firebase token did not finish. API-Code: \(apiResponse.apiCode)")
                        }
                    })
                    .store(in: &self.cancellables)
            }
        } else {
            print("User is not logged in, uploading Firebase token on next app startup or after login.")
        }
    }
}
