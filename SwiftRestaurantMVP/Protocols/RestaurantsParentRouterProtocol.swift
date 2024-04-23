//
//  RestaurantsParentRouterProtocol.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation
import UIKit

protocol RestaurantsParentRouterProtocol:AnyObject {
  func showRestaurantsList(model: RestaurantsInfoModel?,
                           delegate: RestaurantsListPresenterDelegate?)
  func showRestaurantsMap(userLocation: LocationModel,
                          model: RestaurantsInfoModel?)
}
