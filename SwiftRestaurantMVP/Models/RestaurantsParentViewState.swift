//
//  RestaurantsParentViewState.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

enum RestaurantsParentViewState:Equatable {
  case clear
  case loading
  case error(message:String)
  case render
}
