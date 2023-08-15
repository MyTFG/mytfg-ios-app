//
//  AnyCodableValue.swift
//  MyTFG
//
//  Created by Jakob Handke on 22.09.22.
//
// stolen from: https://gist.github.com/sajjadsarkoobi/9376dfee0f63e9da3483c1363dfa9078

import Foundation

enum AnyCodableValue: Codable {
    case integer(Int)
    case string(String)
    case float(Float)
    case double(Double)
    case boolean(Bool)
    case null

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let value = try? container.decode(Int.self) {
            self = .integer(value)
            return
        }

        if let value = try? container.decode(String.self) {
            self = .string(value)
            return
        }

        if let value = try? container.decode(Float.self) {
            self = .float(value)
            return
        }

        if let value = try? container.decode(Double.self) {
            self = .double(value)
            return
        }

        if let value = try? container.decode(Bool.self) {
            self = .boolean(value)
            return
        }

        if let value = try? container.decode(String.self) {
            self = .string(value)
            return
        }

        if container.decodeNil() {
            self = .string("")
            return
        }

        throw DecodingError
            .typeMismatch(AnyCodableValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        case .float(let value):
            try container.encode(value)
        case .double(let value):
            try container.encode(value)
        case .boolean(let value):
            try container.encode(value)
        case .null:
            try container.encode(self)
        }
    }

    // Get safe Values
    var stringValue: String {
        switch self {
        case .string(let value):
            return value
        case .integer(let value):
            return "\(value)"
        case .double(let value):
            return "\(value)"
        case .float(let value):
            return "\(value)"
        default:
            return ""
        }
    }

    var intValue: Int {
        switch self {
        case .integer(let value):
            return value
        case .string(let value):
            return (Int(value) ?? 0)
        case .float(let value):
            return Int(value)
        case .null:
            return 0
        default:
            return 0
        }
    }

    var floatValue: Float {
        switch self {
        case .float(let value):
            return value
        case .integer(let value):
            return Float(value)
        case .string(let value):
            return (Float(value) ?? 0)
        default:
            return 0
        }
    }

    var doubleValue: Double {
        switch self {
        case .double(let value):
            return value
        case .string(let value):
            return (Double(value) ?? 0.0)
        case .integer(let value):
            return (Double(value))
        case .float(let value):
            return (Double(value))
        default:
            return 0.0
        }
    }

    var booleanValue: Bool {
        switch self {
        case .boolean(let value):
            return value
        case .integer(let value):
            return value == 1
        case .string(let value):
            let bool = (Int(value) ?? 0) == 1
            return bool
        default:
            return false
        }
    }
}
