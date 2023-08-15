//
//  AbbreviationItemViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import Foundation

class AbbreviationItemViewModel: ObservableObject, Identifiable {
    private let item: Abbreviation

    init(_ item: Abbreviation) {
        self.item = item
    }

    var getName: String {
        return item.name
    }

    var getAbbreviation: String {
        return item.abbreviation
    }
}
