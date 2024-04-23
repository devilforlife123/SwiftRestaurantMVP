//
//  RestaurantsParentView.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation
import UIKit

protocol RestaurantsParentView:ViewProtocol {
  var presenter:RestaurantsParentPresenterProtocol! { get set }
  func changeViewState(viewState:RestaurantsParentViewState)
}
