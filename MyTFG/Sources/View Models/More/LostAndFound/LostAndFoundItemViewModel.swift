//
//  LostAndFoundItemViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 10.12.21.
//

import Foundation

class LostAndFoundItemViewModel: ObservableObject, Identifiable {
    private let description: String
    private let date: String

    init(_ item: LostAndFoundItem) {
        let dateFormatter = CustomDateFormatter(timestamp: item.properties.registerDateTimestamp)

        self.description = item.properties.description
        self.date = dateFormatter.getLostAndFoundDate()
    }

    var getDescription: String {
        return self.description
    }

    var getDate: String {
        return self.date
    }
}
