//
//  MainTabViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 02.06.22.
//

import Foundation

class MainTabViewModel: ObservableObject {
    static let shared = MainTabViewModel()

    @Published var selectedTab = MainTabViewState.events
}
