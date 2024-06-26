//
//  NetworkService.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

struct NetworkService: NetworkServiceProtocol {
  func processRequest(request: Request, completion: @escaping  NetworkCompletion) {
    guard let url = constructURLForRequest(request: request) else {
      DispatchQueue.main.async {
        completion(.failure(.apiInvalid))
      }
      return
    }
    let urlRequest = URLRequest(url: url)
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      if error != nil {
        DispatchQueue.main.async {
          completion(.failure(.apiFailure))
        }
      } else if let data = data {
        DispatchQueue.main.async {
          completion(.success(data))
        }
      } else {
        completion(.failure(.unknown))
      }
    }.resume()
  }

  private func constructURLForRequest(request: Request) -> URL? {
      var queryItems: [URLQueryItem]?

      if var parameters = request.params {
          parameters["key"] = NetworkServiceConstants.apiKey
          queryItems = parameters.map { (key, value) in
              URLQueryItem(name: key, value: "\(value)")
          }
      }
      var components = URLComponents()
      components.scheme = NetworkServiceConstants.scheme
      components.host = NetworkServiceConstants.baseURL
      components.path = request.path
      components.queryItems = queryItems

      return components.url
  }
}
