//
//  RestaurantsListView.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation
protocol RestaurantsListView:ViewProtocol {
  var presenter:RestaurantsListPresenterProtocol! { get set }
  func changeViewState(viewState:RestaurantsListViewState)
}
