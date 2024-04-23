//
//  RestaurantDetailsBuilder.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation
import UIKit

final class RestaurantDetailsBuilder {
  func buildRestaurantDetailsView(router:RestaurantDetailsRouterProtocol,restaurantModel:RestaurantModel) -> RestaurantDetailsView {

    let restaurantDetailsView = RestaurantDetailsViewController.instantiate()
    restaurantDetailsView.presenter = buildRestaurantDetailsPresenter(view: restaurantDetailsView, router: router, restaurantModel: restaurantModel)
    return restaurantDetailsView
  }

  private func buildRestaurantDetailsPresenter(view:RestaurantDetailsView,router:RestaurantDetailsRouterProtocol,restaurantModel:RestaurantModel) -> RestaurantDetailsPresenterProtocol {
    return RestaurantDetailsPresenter(view:view,router:router,restaurantModel:restaurantModel,getRestaurantImageUsecase:buildRestaurantImageUsecase())
  }

  private func buildRestaurantImageUsecase() -> GetRestaurantImageDataUsecase {
    let provider = RestaurantsProvider()
    //
    return GetRestaurantImageDataUsecase(provider: provider)
  }
}
