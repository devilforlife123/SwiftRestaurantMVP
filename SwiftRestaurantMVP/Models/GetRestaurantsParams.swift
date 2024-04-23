//
//  GetRestaurantsParams.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

struct GetRestaurantParams {
  typealias Completion = (Result<RestaurantsInfoModel,UseCaseError>)->()
  let location:LocationModel
  let nextPageInfo:String?
  let completion:Completion
}
