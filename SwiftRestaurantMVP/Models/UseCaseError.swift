//
//  UseCaseError.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

enum UseCaseError:Error {
  case mapping(Error)
  case underlying(Error)
  case noAccess
  case generic
  case network(NetworkError)
}

enum NetworkError: Error {
    case api(APIError)
    case timeout(Error)
    case generic(Error)
    case noConnection(Error)
}

enum APIError {
    case error500(Error)
}

