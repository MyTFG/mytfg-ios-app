//
//  LostAndFoundViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 10.12.21.
//

import Foundation
import Combine

class LostAndFoundViewModel: ObservableObject, LostAndFoundService {
    var apiSession: APIService

    private var cancellables = Set<AnyCancellable>()

    @Published var searchQuery: String = ""
    @Published private(set) var isLoading = true
    @Published private(set) var items = [LostAndFoundItemViewModel]()
    @Published private(set) var errorMessage: String = ""

    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }

    func onAppear() {
        loadLostAndFoundItems()
    }

    func onRefresh() {
        loadLostAndFoundItems()
    }

    private func loadLostAndFoundItems() {
        self.getLostAndFoundList()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error lost and found \(error)")
                    self.errorMessage = "\(error.localizedDescription)"
                    self.isLoading = false
                case .finished:
                    break
                }
            }, receiveValue: { lostAndFoundRepo in
                self.items = lostAndFoundRepo.items.map(LostAndFoundItemViewModel.init)
                self.errorMessage = ""
                self.isLoading = false
            })
            .store(in: &cancellables)
    }

    var filteredItems: [LostAndFoundItemViewModel] {
        if searchQuery.isEmpty {
            return items
        } else {
            return items.filter { $0.getDescription.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
}
