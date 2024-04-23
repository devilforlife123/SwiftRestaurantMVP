//
//  RestaurantDetailsView.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation

protocol RestaurantDetailsView:ViewProtocol {
  var presenter:RestaurantDetailsPresenterProtocol! { get }
  func changeViewState(viewState:RestaurantDetailsViewState)
}
