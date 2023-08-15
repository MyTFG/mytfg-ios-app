//
//  AbbreviationViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import Foundation
import Combine

class AbbreviationViewModel: ObservableObject, AbbreviationService {
    var apiSession: APIService

    private var type: AbbreviationType

    @Published private(set) var items = [AbbreviationItemViewModel]()
    @Published var searchQuery: String = ""
    @Published private(set) var isLoading = true
    @Published private(set) var errorMessage: String = ""

    private var cancellables = Set<AnyCancellable>()

    init(_ type: AbbreviationType, apiSession: APIService = APISession()) {
        self.apiSession = apiSession
        self.type = type
    }

    func onAppear() {
        loadAbbreviations()
    }

    func onRefresh() {
        loadAbbreviations()
    }

    private func loadAbbreviations() {
        self.getAbbreviationList(type)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error abbreviation: \(error)")
                    self.errorMessage = "\(error.localizedDescription)"
                    self.isLoading = false
                case .finished:
                    break
                }
            }, receiveValue: { abbreviationRepo in
                if let teachers = abbreviationRepo.teachers {
                    self.errorMessage = ""
                    self.items = teachers.map(AbbreviationItemViewModel.init)
                    self.isLoading = false
                } else if let subjects = abbreviationRepo.subjects {
                    self.errorMessage = ""
                    self.items = subjects.map(AbbreviationItemViewModel.init)
                    self.isLoading = false
                } else {
                    fatalError("neither subjects nor teachers provided in json data from mytfg")
                }
            })
            .store(in: &cancellables)
    }

    var filteredItems: [AbbreviationItemViewModel] {
        if searchQuery.isEmpty {
            return items
        } else {
            return items.filter {
                $0.getName.localizedCaseInsensitiveContains(searchQuery) ||
                $0.getAbbreviation.localizedCaseInsensitiveContains(searchQuery)
            }
        }
    }

    var getTitle: String {
        switch type {
        case .teachers:
            return "Lehrerkürzel"
        case .subjects:
            return "Fächerkürzel"
        }
    }
}
