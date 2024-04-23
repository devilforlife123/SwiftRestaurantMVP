//
//  RestaurantsListBuilder.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation

final class RestaurantsListBuilder {
  
  func buildRestaurantsListView(router: RestaurantsListRouterProtocol, delegate: RestaurantsListPresenterDelegate?) -> RestaurantsListView {
      let restaurantsListView = RestaurantsListViewController.instantiate()
      restaurantsListView.presenter = buildRestaurantsListPresenter(view: restaurantsListView,
                                                                    delegate: delegate,
                                                                    router: router)
      return restaurantsListView
  }

  private func buildRestaurantsListPresenter(view: RestaurantsListView,
                                             delegate: RestaurantsListPresenterDelegate?,
                                             router: RestaurantsListRouterProtocol) -> RestaurantsListPresenterProtocol {
      return RestaurantsListPresenter(view: view,
                                      router: router,
                                      delegate: delegate)
  }
}
