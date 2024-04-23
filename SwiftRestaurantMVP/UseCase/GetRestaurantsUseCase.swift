//
//  GetRestaurantsUseCase.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

final class GetRestaurantUsecase: GetRestaurantsUsecaseProtocol {
  private let provider:RestaurantsProviderProtocol!

  init(provider: RestaurantsProviderProtocol) {
      self.provider = provider
  }

  func run(_ params:GetRestaurantParams) {
    provider.getRestaurantList(location: params.location, nextPageInfo: params.nextPageInfo) { result in
      params.completion(result)
    }
  }
}
