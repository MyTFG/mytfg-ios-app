//
//  LinksViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 16.12.21.
//

import Foundation
import SwiftUI

class LinksViewModel: ObservableObject {
    var links: [LinkItemViewModel]

    init() {
        links = [
            LinkItemViewModel(label: "TFG Webseite", url: URL(string: "https://tfg-duesseldorf.de")!, image: Image("TFG-Logo")),
            LinkItemViewModel(label: "MyTFG Plattform", url: URL(string: "https://mytfg.de")!, image: Image("MyTFG-Ball")),
            LinkItemViewModel(label: "TFG Moodle", url: URL(string: "http://tfgmoodle.de")!, image: Image("Moodle-Logo")) // HTTP, da 301
        ]
    }
}
