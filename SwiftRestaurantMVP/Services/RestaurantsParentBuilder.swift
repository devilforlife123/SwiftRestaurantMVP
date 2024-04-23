//
//  RestaurantsParentBuilder.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

final class RestaurantsParentBuilder {
  func buildRestaurantsParentView(router: RestaurantsParentRouterProtocol) -> RestaurantsParentView {
      let restaurantsParentView = RestaurantsParentViewController.instantiate()
    //RestaurantParentsView presenter is created using the restaurant parent View and the router //
    restaurantsParentView.presenter = buildRestaurantsParentPresenter(view: restaurantsParentView, router: router)
      return restaurantsParentView
  }

  private func buildRestaurantsParentPresenter(view: RestaurantsParentView,
                                               router: RestaurantsParentRouterProtocol) -> RestaurantsParentPresenterProtocol {
    //Create the use case as well
    let getRestaurantsUsecaseProtocol = buildGetRestaurantsUsecase()
    return RestaurantsParentPresenter(view: view, getRestaurantsUsecase: getRestaurantsUsecaseProtocol
                                      , router: router)
  }

  private func buildGetRestaurantsUsecase() -> GetRestaurantsUsecaseProtocol {
    let providerProtocol = RestaurantsProvider()
    return GetRestaurantUsecase(provider: providerProtocol)
  }
  
}
