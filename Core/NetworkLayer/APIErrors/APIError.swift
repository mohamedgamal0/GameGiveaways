//
//  APIError.swift
//  GamePowerGiveaways
//
//  Created by Mohamed Gamal on 12/07/2024.
//

import Foundation

enum APIError: Error, Equatable {
    case networkError(Error)
    case decodingError(Error)
    case unknown
    
    static func ==(lhs: APIError, rhs: APIError) -> Bool {
        switch (lhs, rhs) {
        case (.networkError(let lhsError), .networkError(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (.decodingError(let lhsError), .decodingError(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (.unknown, .unknown):
            return true
        default:
            return false
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
