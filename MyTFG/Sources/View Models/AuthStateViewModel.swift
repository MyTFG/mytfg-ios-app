//
//  AuthStateViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 13.01.22.
//

import Foundation
import Combine
import Firebase

class AuthStateViewModel: ObservableObject, AuthenticationService {
    @Published private(set) var isLoggedIn: Bool
    @Published private(set) var isLoadingSessions: Bool = true
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var isLoggingIn: Bool = false

    @Published private(set) var activeSessions: [SessionItemViewModel] = []
    @Published private(set) var timedOutSessions: [SessionItemViewModel] = []

    @Published private(set) var firstName: String = ""
    @Published private(set) var lastName: String = ""
    @Published private(set) var username: String = ""
    @Published private(set) var grade: String = ""
    @Published private(set) var avatarURL: URL?

    @Published private(set) var errorMessage: String = ""

    internal var secretService = SecretService()
    internal var apiSession: APIService
    private let notificationService: NotificationService = NotificationService()

    var cancellables = Set<AnyCancellable>()

    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
        self.isLoggedIn = secretService.isLoggedIn()
        self.updateFirebase()
        #if DEBUG
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            self.isLoggedIn = true
        }
        #endif
    }

    func onRefresh() {
        loadSessions()
    }

    func doLogin(username: String, password: String) {
        self.isLoggingIn = true
        self.login(username: username, password: password)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error login: \(error.localizedDescription)")
                    self.isLoggedIn = false
                    self.isLoggingIn = false
                    switch error {
                    case .noPermission:
                        self.errorMessage = "Benutzername oder Passwort falsch."
                    default:
                        self.errorMessage = "\(error.localizedDescription)"
                    }
                case .finished:
                    break
                }
            }, receiveValue: { loginResponse in
                if self.isValidLoginResponse(response: loginResponse) {
                    DispatchQueue.main.async {
                        self.isLoggedIn = true
                        self.isLoggingIn = false
                        self.updateFirebase()
                    }
                    self.storeCredentials(userApiResponse: loginResponse)
                }
            })
            .store(in: &cancellables)
    }

    func doLogout() {
        self.logout()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(APIError.noPermission):
                    print("already logged out, deleting local auth storage")
                    self.isLoggedIn = false
                    self.deleteAccount()
                case .failure(let error):
                    print("logout didnt work \(error)")
                    self.errorMessage = "\(error.localizedDescription)"
                    self.isLoading = false
                case .finished:
                    print("logout did work")
                    self.errorMessage = ""
                    self.isLoading = false
                    self.deleteAccount()
                }
            }, receiveValue: {_ in})
            .store(in: &self.cancellables)
    }

    func loadSessions() {
        DispatchQueue.main.async {
            self.isLoadingSessions = true

            let mytfgAccount = self.secretService.retrieveAccount()
            self.firstName = mytfgAccount?.getMyTFGUser.getFirstName ?? ""
            self.lastName = mytfgAccount?.getMyTFGUser.getLastName ?? ""
            self.username = mytfgAccount?.getMyTFGUser.getUsername ?? ""
            self.grade = mytfgAccount?.getMyTFGUser.getGrade ?? ""

            self.avatarURL = mytfgAccount?.getMyTFGUser.avatarURL
        }

        self.getAuthList()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error loadSessions \(error)")
                    self.isLoadingSessions = false
                    self.isLoading = false
                    self.errorMessage = "\(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { apiResponse in
                self.activeSessions = apiResponse.activeSessions.map(SessionItemViewModel.init)
                self.timedOutSessions = apiResponse.timedOutSessions.map(SessionItemViewModel.init)
                self.isLoadingSessions = false
                self.isLoading = false
                self.errorMessage = ""
            })
            .store(in: &self.cancellables)
    }

    func deleteSession(sessionItemViewModel: SessionItemViewModel) {
        self.removeSession(device: sessionItemViewModel.sessionItem.device)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error deleteSession \(error)")
                    self.errorMessage = "\(error.localizedDescription)"
                    self.isLoading = false
                case .finished:
                    break
                }
            }, receiveValue: { apiResponse in
                if apiResponse.apiCode == 200 {
                    self.activeSessions.removeAll(where: { $0.sessionItem.device == sessionItemViewModel.sessionItem.device })
                    self.isLoading = false
                    self.errorMessage = ""
                }
            })
            .store(in: &self.cancellables)
    }

    func handleAPIError(apiError: APIError) {
        switch apiError {
        case .noPermission:
            self.doLogout()
        default:
            break
        }
    }

    private func updateFirebase() {
        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching FCM registration token: \(error.localizedDescription)")
            } else if let token = token {
                self.notificationService.updateFirebaseToken(token: token)
            }
        }
    }

    private func isValidLoginResponse(response: UserAPIResponse) -> Bool {
        return response.apiCode == 200 && response.status == 200
    }

    private func storeCredentials(userApiResponse: UserAPIResponse) {
        let mytfgAccount = MyTFGAccount(userModel: userApiResponse.currentUser,
                                        tokenString: userApiResponse.token,
                                        tokenExpires: userApiResponse.expires)
        do {
            try secretService.saveAccount(mytfgAccount)
        } catch {
            self.errorMessage = "Die Logindaten konnten nicht gespeichert werden."
            print("login Daten konnten nicht gespeichert werden.")
        }
    }

    private func deleteAccount() {
        self.isLoggedIn = false
        self.errorMessage = ""
        self.activeSessions = []
        self.timedOutSessions = []
        self.firstName = ""
        self.lastName = ""
        self.username = ""
        self.grade = ""
        self.avatarURL = nil

        do {
            try secretService.deleteAccount()
        } catch {
            self.errorMessage = "Logindaten konnten nicht vom Gerät entfernt werden."
        }

        AppSettings.shared.selectedAdditionalClasses = []
    }
}
