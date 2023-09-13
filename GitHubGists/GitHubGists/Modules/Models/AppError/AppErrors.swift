//
//  AppError.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import Foundation

protocol AppError: Error {
    var localizedDescription: String { get }
    var type: ErrorType { get }
}

enum ErrorType {
    case networking
    case validation
}

enum ValidationError: AppError {
    case invalid
    
    var localizedDescription: String {
        switch self {
        case .invalid:
            return "Invalid username"
        }
    }
    
    var type: ErrorType {
        return .validation
    }
}

enum NetworkingError: AppError {
    
    case parsing(message: String)
    case network(message: String)
    
    var localizedDescription: String {
        switch self {
        case .parsing(let message):
            return message
            
        case .network(let message):
            return message
        }
    }
    
    var type: ErrorType {
        return .networking
    }
}
