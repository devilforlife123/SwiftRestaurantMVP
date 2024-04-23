//
//  DataError.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

enum DataError: Error {
    case apiFailure
    case apiInvalid
    case parseFail
    case networkError
    case unknown
}
