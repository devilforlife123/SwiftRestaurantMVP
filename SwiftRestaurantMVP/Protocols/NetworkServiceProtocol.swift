//
//  NetworkServiceProtocol.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

protocol NetworkServiceProtocol {
  typealias NetworkCompletion = (Result<Data, DataError>) -> Void
  func processRequest(request: Request, completion: @escaping  NetworkCompletion)
}
