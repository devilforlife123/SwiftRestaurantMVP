//
//  RestaurantDetailsRouterProtocol.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation

protocol RestaurantDetailsRouterProtocol:AnyObject {
  func showMapNavigation(name:String,locationModel:LocationModel)
}
