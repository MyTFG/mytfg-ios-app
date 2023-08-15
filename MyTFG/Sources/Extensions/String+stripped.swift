//
//  String+stripped.swift
//  MyTFG
//
//  Created by Jakob Handke on 28.09.21.
//

import Foundation

extension String {
    /// Return string with dashed stripped.
    var dashStripped: String {
        return self
            .replacingOccurrences(of: "- ", with: "")
    }
}
