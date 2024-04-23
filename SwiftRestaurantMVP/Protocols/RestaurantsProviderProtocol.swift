//
//  RestaurantsProviderProtocol.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

protocol RestaurantsProviderProtocol {
  typealias RestaurantsListCompletion = (Result<RestaurantsInfoModel,UseCaseError>)->()
  typealias RestaurantsImageDataCompletion = (Result<Data,UseCaseError>)->()
  func getRestaurantList(location:LocationModel,nextPageInfo:String?,completion:@escaping RestaurantsListCompletion)
  func getRestaurantImageData(imageReference:String,completion:@escaping RestaurantsImageDataCompletion)
}
