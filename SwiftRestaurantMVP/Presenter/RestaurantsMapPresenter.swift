//
//  RestaurantsMapPresenter.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation
import CoreLocation

final class RestaurantsMapPresenter:RestaurantsMapPresenterProtocol {
  private weak var view: RestaurantsMapView?
  private weak var router: RestaurantsMapRouterProtocol!
  private var userLocation: LocationModel
  private var restaurantsModels: [RestaurantModel]?
  private let latitudeDelta: CLLocationDegrees = 0.01
  private let longitudeDelta: CLLocationDegrees = 0.01

  private var viewState: RestaurantsMapViewState = .clear {
      didSet {
          guard oldValue != viewState else {
              return
          }
          view?.changeViewState(viewState: viewState)
      }
  }
  
  init(view: RestaurantsMapView?,
       userLocation: LocationModel,
       router: RestaurantsMapRouterProtocol) {
      self.view = view
      self.userLocation = userLocation
      self.router = router
  }

  func didSelectAnnotation(coordinate: CLLocationCoordinate2D?) {

  }

  func viewLoaded() {
  }

  func viewAppeared() {
  }


}
extension RestaurantsMapPresenter:RestaurantsMapChildPresenterProtocol {

  func setRestaurantsInfoModel(_ model: RestaurantsInfoModel?,
                               userLocation: LocationModel) {
    self.restaurantsModels = model?.restaurantsModels ?? []
    self.userLocation = userLocation
    calculateViewState()
  }

  private func calculateViewState() {
      let userLocationCoordinates = CLLocationCoordinate2DMake(userLocation.latitude,
                                                               userLocation.longitude)
      let restaurantLocationsViewModels = restaurantsModels?.compactMap {
          getLocationViewModel(restaurantModel: $0)
      }

      let viewModel = RestaurantsMapViewState.ViewModel(userLocation: userLocationCoordinates,
                                                        restaurantsLocations: restaurantLocationsViewModels ?? [],
                                                        latitudeDelta: self.latitudeDelta,
                                                        longitudeDelta: self.longitudeDelta)
      viewState = .render(viewModel: viewModel)
  }

  private func getLocationViewModel(restaurantModel: RestaurantModel) -> RestaurantsMapViewState.LocationViewModel {
      let coordinates = CLLocationCoordinate2DMake(restaurantModel.locationModel.latitude,
                                                   restaurantModel.locationModel.longitude)
      let title = restaurantModel.name
      var subtitle: String = ""
      if let isOpen = restaurantModel.openStatus {
          subtitle = isOpen ? "Currently Open" : "Currently Closed"
      }
      return RestaurantsMapViewState.LocationViewModel(location: coordinates,
                                                       title: title,
                                                       subtitle: subtitle)
  }

}
