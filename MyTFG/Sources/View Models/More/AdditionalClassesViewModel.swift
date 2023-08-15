//
//  AdditionalClassesViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 24.02.22.
//

import Foundation
import Combine

class AdditionalClassesViewModel: ObservableObject, FirebaseService {
    var apiSession: APIService
    var secretService: SecretService = SecretService()

    @Published var selectedClasses = Set<String>()
    @Published private(set) var availableClasses = [String]()
    @Published private(set) var errorMessage = ""
    @Published private(set) var alertMessage = ""
    @Published var alertPresented: Bool = false

    @Published private(set) var isLoading: Bool = true
    @Published private(set) var isSendingAbos: Bool = false
    @Published private(set) var saveButtonDisabled: Bool = true

    private var cancellables = Set<AnyCancellable>()

    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }

    func onAppear() {
        self.loadAvailableClasses()
        self.loadSelectedClassesFromAppSettings()
    }

    func onRefresh() {
        self.loadAvailableClasses()
        self.loadSelectedClassesFromAppSettings()
    }

    func saveButtonAction() {
        self.storeSelectedClassesToAppSettings()
        self.updateSelectedClassesInMyTFG()
    }

    func onTapAction(cls: String) {
        if self.selectedClasses.contains(cls) {
            self.selectedClasses.remove(cls)
        } else {
            if self.selectedClasses.count == 3 {
                self.alertMessage = "Sie können nur drei weitere Klassen auswählen."
                self.alertPresented = true
            } else {
                self.selectedClasses.insert(cls)
            }
        }
        self.saveButtonDisabled = false
    }

    private func loadAvailableClasses() {
        self.getAvailableClasses()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error loadClasses: \(error)")
                    self.isLoading = false
                    self.errorMessage = "\(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { response in
                self.availableClasses = response.availableClasses
                self.isLoading = false
                self.errorMessage = ""
            })
            .store(in: &cancellables)
    }

    private func updateSelectedClassesInMyTFG() {
        print(selectedClasses)
        self.isSendingAbos = true
        self.updateFirebaseAbos(abos: selectedClasses)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error updateFirebaseAbos: \(error)")
                    self.errorMessage = "\(error.localizedDescription)"
                    self.isSendingAbos = false
                case .finished:
                    break
                }
            }, receiveValue: { _ in
                self.errorMessage = ""
                self.isSendingAbos = false
            })
            .store(in: &cancellables)
        self.saveButtonDisabled = true
    }

    private func loadSelectedClassesFromAppSettings() {
        DispatchQueue.main.async {
            self.selectedClasses = AppSettings.shared.selectedAdditionalClasses
        }
    }

    private func storeSelectedClassesToAppSettings() {
        AppSettings.shared.selectedAdditionalClasses = self.selectedClasses
    }
}
