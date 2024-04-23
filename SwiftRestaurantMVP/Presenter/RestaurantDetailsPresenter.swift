//
//  RestaurantDetailsPresenter.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation
import UIKit

final class RestaurantDetailsPresenter:RestaurantDetailsPresenterProtocol {
  private weak var view: RestaurantDetailsView?

  private weak var router: RestaurantDetailsRouterProtocol!
  private var restaurantModel: RestaurantModel!
  private var getRestaurantImageUsecase: GetRestaurantImageDataUsecase!
  private var imageData: Data?

  private var viewState: RestaurantDetailsViewState = .clear {
      didSet {
          guard oldValue != viewState else {
              return
          }
          view?.changeViewState(viewState: viewState)
      }
  }

  init(view: RestaurantDetailsView?,
       router: RestaurantDetailsRouterProtocol,
       restaurantModel: RestaurantModel,
       getRestaurantImageUsecase: GetRestaurantImageDataUsecase) {
      self.view = view
      self.router = router
      self.restaurantModel = restaurantModel
      self.getRestaurantImageUsecase = getRestaurantImageUsecase
  }

  func viewLoaded() {
    calculateViewState()
    loadRestaurantImage()
  }

  private func loadRestaurantImage() {
    guard let imageReference = restaurantModel.photoReference else {
      return
    }
    let params = GetRestaurantImageDataParams(imageReference: imageReference) { [weak self] result in
      guard let self = self else {
        return
      }
      if case .success(let imageData) = result {
        self.imageData = imageData
        self.calculateViewState()
      }
    }
    getRestaurantImageUsecase.run(params)
  }

  private func calculateViewState() {
    var openStatusString:String?
    if let status = restaurantModel.openStatus {
      openStatusString = status ? "Open now": "Closed now"
    }
    let viewModel = RestaurantDetailsViewState.ViewModel(name: restaurantModel.name,
                                                         address: restaurantModel.address ?? "Not Available",
                                                         status: openStatusString ?? "Not Available",
                                                         imageData: imageData)
    viewState = .render(viewModel: viewModel)
  }

  func startNavigationButtonPressed() {
      router.showMapNavigation(name: restaurantModel.name,
                               locationModel: restaurantModel.locationModel)
  }


}
