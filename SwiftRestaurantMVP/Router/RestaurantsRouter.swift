//
//  RestaurantsRouter.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation
import UIKit

final class RestaurantsRouter {
  private weak var navigationController:UINavigationController?
  private weak var restaurantsParentViewController:UIViewController?
  private var restaurantsListViewController:UIViewController?
  private var restaurantsMapViewController:UIViewController?

  init(navigationController: UINavigationController) {
      self.navigationController = navigationController
  }

  func start() {
    guard let restaurantsParentViewController = RestaurantsParentBuilder().buildRestaurantsParentView(router: self) as? UIViewController else {
      fatalError("RestaurantsParentViewController not built")
    }
    self.restaurantsParentViewController = restaurantsParentViewController
    navigationController?.pushViewController(restaurantsParentViewController, animated: false)
  }
}

extension RestaurantsRouter: RestaurantsParentRouterProtocol {
  func showRestaurantsList(model: RestaurantsInfoModel?, delegate: RestaurantsListPresenterDelegate?) {
    if restaurantsListViewController == nil {
      guard let buildRestaurantsListViewController = RestaurantsListBuilder().buildRestaurantsListView(router: self, delegate: delegate)  as? UIViewController else {
        fatalError("RestaurantsListViewController not built")
      }
      self.restaurantsListViewController = buildRestaurantsListViewController
    }
    if let restaurantsListViewController = restaurantsListViewController {
      restaurantsParentViewController?.children.forEach({$0.removeChildFromParent()})
      restaurantsParentViewController?.add(restaurantsListViewController)
      let listChildPresenter = (restaurantsListViewController as? RestaurantsListView)?.presenter as? RestaurantsListChildPresenterProtocol
      listChildPresenter?.setRestaurantsInfoModel(model)
    }
  }

  func showRestaurantsMap(userLocation: LocationModel, model: RestaurantsInfoModel?) {
      if restaurantsMapViewController == nil { // MapViewController not initialized
          guard let builtRestaurantsMapViewController = RestaurantsMapBuilder().buildRestaurantsMapView(router: self,
                                                                                                        userLocation: userLocation) as? UIViewController else {
              fatalError("RestaurantsMapViewController not built")
          }
          self.restaurantsMapViewController = builtRestaurantsMapViewController
      }
      if let restaurantsMapViewController = restaurantsMapViewController {
          restaurantsParentViewController?.children.forEach {
              $0.removeChildFromParent()
          }
          restaurantsParentViewController?.add(restaurantsMapViewController)
          let mapsChildPresenter = ((restaurantsMapViewController as? RestaurantsMapView)?.presenter as? RestaurantsMapChildPresenterProtocol)
          mapsChildPresenter?.setRestaurantsInfoModel(model,
                                                      userLocation: userLocation)
      }
  }
}

extension RestaurantsRouter: RestaurantsListRouterProtocol, RestaurantsMapRouterProtocol {
  func showRestaurantDetails(model: RestaurantModel) {
    guard let restaurantDetailsViewController = RestaurantDetailsBuilder().buildRestaurantDetailsView(router:self,restaurantModel:model) as? UIViewController else {
      fatalError("RestaurantsListViewController not built")
    }
    navigationController?.pushViewController(restaurantDetailsViewController,
                                             animated: true)
  }
}

extension RestaurantsRouter: RestaurantDetailsRouterProtocol {
    func showMapNavigation(name: String, locationModel: LocationModel) {
      MapsRouter().startNavigation(name: name, locationModel: locationModel)
    }
}
