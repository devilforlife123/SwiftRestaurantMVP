//
//  RestaurantsMapViewController.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation
import UIKit
import MapKit

class RestaurantsMapViewController:UIViewController, RestaurantsMapView{
  static var storyboardName: String {
      "RestaurantsMap"
  }

  var presenter: RestaurantsMapPresenterProtocol!
  @IBOutlet private weak var mapView: MKMapView!

  func changeViewState(viewState: RestaurantsMapViewState) {
    switch viewState {
    case .clear:
        break
    case .render(let viewModel):
        renderViewModel(viewModel: viewModel)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    presenter.viewLoaded()
  }

  private func setupViews() {
      mapView.showsUserLocation = true
      mapView.delegate = self
  }

  private func renderViewModel(viewModel: RestaurantsMapViewState.ViewModel) {
      mapView.removeAnnotations(mapView.annotations)
      let annotations = viewModel.restaurantsLocations.map {
          RestaurantAnnotation(title: $0.title, coordinate: $0.location, subtitle: $0.subtitle)
      }
      mapView.addAnnotations(annotations)
      let span = MKCoordinateSpan(latitudeDelta: viewModel.latitudeDelta,
                                  longitudeDelta: viewModel.longitudeDelta)
      let region = MKCoordinateRegion(center: viewModel.userLocation, span: span)
      mapView.setRegion(region, animated: true)
  }

}
extension RestaurantsMapViewController:MKMapViewDelegate {
  
}

