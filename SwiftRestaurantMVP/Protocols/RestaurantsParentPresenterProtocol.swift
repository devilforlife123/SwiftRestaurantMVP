//
//  RestaurantsParentPresenterProtocol.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

protocol RestaurantsParentPresenterProtocol:PresenterProtocol {
  func didSelectTab(index: Int)
  func didTapRetryOption()
}

