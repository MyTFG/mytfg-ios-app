//
//  LinkItemViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 16.12.21.
//

import Foundation
import SwiftUI

class LinkItemViewModel: ObservableObject, Identifiable {
    @Published var label: String
    @Published var url: URL
    @Published var image: Image

    init(label: String, url: URL, image: Image) {
        self.label = label
        self.url = url
        self.image = image
    }
}
