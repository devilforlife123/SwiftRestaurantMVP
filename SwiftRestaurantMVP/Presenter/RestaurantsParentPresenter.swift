//
//  RestaurantsParentPresenter.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation
import CoreLocation

enum SelectedTabType: Int {
    case list
    case map
}

final class RestaurantsParentPresenter: NSObject, RestaurantsParentPresenterProtocol {
  private weak var view:RestaurantsParentView?
  private weak var router:RestaurantsParentRouterProtocol!
  private var getRestaurantsUsecase:GetRestaurantsUsecaseProtocol!
  private var currentSelectedTabType: SelectedTabType = .list
  private var restaurantsInfoModel: RestaurantsInfoModel?
  private var locationManager: CLLocationManager!
  private var currentLocation: LocationModel?

  private var viewState: RestaurantsParentViewState = .clear {
    didSet {
        guard oldValue != viewState else {
            return
        }
        view?.changeViewState(viewState: viewState)
    }
  }
  init(view: RestaurantsParentView?,
       getRestaurantsUsecase: GetRestaurantsUsecaseProtocol,
       router: RestaurantsParentRouterProtocol) {
      self.view = view
      self.getRestaurantsUsecase = getRestaurantsUsecase
      self.router = router
  }

    func viewLoaded() {
        setupLocation()
    }

    private func setupLocation() {
      locationManager = CLLocationManager()
      locationManager.delegate = self
      let minDistanceChangeToUpdateRestaurantsList = 100.0
      locationManager.distanceFilter = minDistanceChangeToUpdateRestaurantsList
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.requestWhenInUseAuthorization()
      if CLLocationManager.locationServicesEnabled() {
          locationManager.delegate = self
          locationManager.desiredAccuracy = kCLLocationAccuracyBest
          locationManager.startUpdatingLocation()
      }
    }

    private func getRestaurants() {
      guard let currentLocation = currentLocation else {
        return
      }
      viewState = .loading
      let params = GetRestaurantParams(location: currentLocation, nextPageInfo: restaurantsInfoModel?.nextPageInfo) { [weak self] result in
        guard let self = self else {
            return
        }
        switch result {
        case .success(let receivedRestaurantsInfoModel):
          let totalRestaurantsModels = (self.restaurantsInfoModel?.restaurantsModels ?? []) + receivedRestaurantsInfoModel.restaurantsModels
          self.restaurantsInfoModel = RestaurantsInfoModel(restaurantsModels: totalRestaurantsModels, nextPageInfo: receivedRestaurantsInfoModel.nextPageInfo)
          self.updateRestaurantsListForCurrentChild()
          self.viewState = .render

        case .failure(let useCaseError):
            var errorMessage: String
            if case .noAccess = useCaseError {
                errorMessage = "This app does not have access to show nearby restaurants currently. Access Denied!"
            } else {
                errorMessage = "Unable to get restaurants list, please retry."
            }
            self.viewState = .error(message: errorMessage)
        }
      }
      self.getRestaurantsUsecase.run(params)
    }

    func didSelectTab(index: Int) {
      guard index != currentSelectedTabType.rawValue, let selectedTabType = SelectedTabType(rawValue: index) else {
        return
      }
      currentSelectedTabType = selectedTabType
      updateRestaurantsListForCurrentChild()
    }

    func didTapRetryOption() {
        getRestaurants()
    }

    private func updateRestaurantsListForCurrentChild() {
      guard let currentLocation = currentLocation else {
          return
      }
      switch currentSelectedTabType {
      case .list:
        router.showRestaurantsList(model: self.restaurantsInfoModel, delegate: self)
      case .map:
          router.showRestaurantsMap(userLocation: currentLocation,
                                    model: self.restaurantsInfoModel)
      }
    }
}

extension RestaurantsParentPresenter: RestaurantsListPresenterDelegate {
    func handleNextPageRequest() {
        getRestaurants()
    }
}

extension RestaurantsParentPresenter: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if CLLocationManager.locationServicesEnabled() {
            switch manager.authorizationStatus {
            case .notDetermined:
                locationManager.requestAlwaysAuthorization()
            case .restricted, .denied:
                viewState = .error(message: "Cannot access location, please authorize the app to access location.")
            case .authorizedAlways, .authorizedWhenInUse:
                locationManager.startUpdatingLocation()
            @unknown default:
                break
            }
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
      //This triggers when the location change is update
      guard let currentLocationCoordinates = manager.location?.coordinate else {
        return
      }
      self.currentLocation = LocationModel(coordinates: currentLocationCoordinates)
      getRestaurants()
    }
}
