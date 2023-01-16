//
//  APError.swift
//  Appetizers
//
//  Created by Arjun Shukla on 12/30/22.
//

import Foundation

enum APError: Error {
    case invlidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

enum AccountError: Error {
    case missingInfo
    case invalidEmail
}
