//
//  APICombineError.swift
//  MyTFG
//
//  Created by Jakob Handke on 08.12.21.
//

import Foundation

enum APIError: LocalizedError {
    case decodingError(Error)
    case noPermission
    case noCredentialsAvailable
    case serverError
    case clientError
    case customError(String)
    case networkUnavailable
    case other(Error)
    case unknown

    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Beim verarbeiten der Daten ist ein Fehler aufgetreten."
        case .noPermission:
            return "Sie haben keine Berechtigung, um auf die Resource zuzugreifen."
        case .noCredentialsAvailable:
            return "Es konnten keine Zugangsdaten gefunden werden."
        case .serverError:
            return "Auf dem Server ist ein Fehler aufgetreten."
        case .clientError:
            return "Auf dem Client ist ein Fehler aufgetreten."
        case .customError, .unknown:
            return "Es ist ein unbekannter Fehler aufgetreten."
        case .networkUnavailable:
            return "Es ist keine Internetverbindung verfügbar."
        case .other(let error):
            return "\(error.localizedDescription)"
        }
    }

    var recoverySuggestion: String? {
        switch self {
        case .noPermission, .noCredentialsAvailable:
            return "Melden Sie sich in der App an."
        case .serverError, .decodingError, .clientError, .customError, .unknown, .other:
            return "Bitte später erneut versuchen."
        case .networkUnavailable:
            return "Bitte stellen Sie sicher, dass die Internetverbindung verfügbar ist und versuchen es erneut."
        }
    }

    var helpAnchor: String? {
        return "Wenn das Problem häufiger auftritt, wenden Sie sich bitte an support@mytfg.de."
    }
}
