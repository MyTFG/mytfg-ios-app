//
//  VRRViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 27.09.21.
//

import Foundation
import Combine
import SwiftUI

class VRRViewModel: ObservableObject, VRRService {
    internal var apiSession: APIService

    @Published private(set) var vrrEntries: [VRRCellViewModel] = [VRRCellViewModel]()
    @Published private(set) var isLoading: Bool = true
    @Published private(set) var errorMessage: String = ""

    var cancellables = Set<AnyCancellable>()

    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }

    func onAppear() {
        getVRRList()
    }

    func onRefresh() {
        if self.vrrEntries.isEmpty {
            self.isLoading = true
        }
        getVRRList()
    }

    private func getVRRList() {
        self.getVRRList()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error VRR: \(error)")
                    self.isLoading = false
                    self.errorMessage = "\(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { (vrrRepo) in
                self.isLoading = false
                self.errorMessage = ""
                self.vrrEntries = vrrRepo.vrr.vrrEntries.map(VRRCellViewModel.init)
            })
            .store(in: &cancellables)
    }
}
