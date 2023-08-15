//
//  EventsViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 20.09.21.
//

import Foundation
import Combine
import SwiftUI

class EventsViewModel: ObservableObject, EventService {
    internal var apiSession: APIService

    @Published private(set) var events = [EventCellViewModel]()
    @Published private(set) var isLoading: Bool = true
    @Published private(set) var errorMessage: String = ""

    var cancellables = Set<AnyCancellable>()

    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }

    func onRefresh() {
        if self.events.isEmpty {
            self.isLoading = true
        }
        getEventList()
    }

    func onAppear() {
        getEventList()
    }

    private func getEventList() {
        let cancellable = self.getEventList()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error events: \(error)")
                    self.isLoading = false
                    self.errorMessage = "\(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { (events) in
                self.events = events.events.map(EventCellViewModel.init)
                self.errorMessage = ""
                self.isLoading = false
            })
        cancellables.insert(cancellable)
    }
}
