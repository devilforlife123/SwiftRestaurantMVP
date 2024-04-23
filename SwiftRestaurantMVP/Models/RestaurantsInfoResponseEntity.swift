//
//  RestaurantsInfoResponseEntity.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

struct RestaurantsInfoResponseEntity: DecodableParentEntityProtocol {
  let restaurants: [RestaurantEntity]
  let nextPageInfo: String?
  let status: Status?

  enum CodingKeys: String, CodingKey {
      case restaurants = "results"
      case nextPageInfo = "next_page_token"
      case status = "status"
  }

  func toDomain() throws -> RestaurantsInfoModel {
    let restaurantsModels = try restaurants.map({try $0.toDomain()})
    return RestaurantsInfoModel(restaurantsModels: restaurantsModels, nextPageInfo: nextPageInfo)
  }

}
