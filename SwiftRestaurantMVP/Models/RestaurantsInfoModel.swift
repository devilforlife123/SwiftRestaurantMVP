//
//  RestaurantInfoModel.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation
struct RestaurantsInfoModel: Equatable {
    let restaurantsModels: [RestaurantModel]
    let nextPageInfo: String?
}
