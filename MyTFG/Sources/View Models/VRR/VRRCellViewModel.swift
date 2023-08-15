//
//  VRRCellViewModel.swift
//  MyTFG
//
//  Created by Jakob Handke on 21.09.21.
//

import Foundation
import SwiftUI

class VRRCellViewModel: ObservableObject, Identifiable {
    private var model: VRRModel

    init(model: VRRModel) {
        self.model = model
    }

    var getLine: String {
        return model.line
    }

    var getDestination: String {
        return model.destination
    }

    var getArrival: String {
        return model.arrival.lowercased()
    }

    var getArrivalColor: Color {
        switch getArrival {
        case "sofort":
            return .red
        case "1 min":
            return .mytfgOrange
        default:
            return .primary
        }
    }

    var getType: String {
        return model.type
    }

    func getMOTImage() -> Image {
        switch getType {
        case "U-Bahn", "Straßenbahn", "Zug":
            return Image(systemName: "tram")
        case "Bus", "Niederflurbus", "NE":
            return Image(systemName: "bus")
        default:
            return Image(systemName: "clock")
        }
    }
}
