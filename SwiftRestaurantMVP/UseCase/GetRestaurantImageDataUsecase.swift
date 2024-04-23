//
//  GetRestaurantImageDataUsecase.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation

final class GetRestaurantImageDataUsecase:GetRestaurantImageDataUseCaseProtocol {

  private let provider: RestaurantsProviderProtocol

  init(provider: RestaurantsProviderProtocol) {
    self.provider = provider
  }
  
  func run(_ params: GetRestaurantImageDataParams) {
    provider.getRestaurantImageData(imageReference: params.imageReference) { result in
      params.completion(result)
    }
  }
}
