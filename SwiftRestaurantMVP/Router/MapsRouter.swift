//
//  MapsRouter.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation
import MapKit

struct MapsRouter {
  func startNavigation(name: String, locationModel: LocationModel) {
      let coordinates = CLLocationCoordinate2DMake(locationModel.latitude,
                                                   locationModel.longitude)
      let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
      let mapItem = MKMapItem(placemark: placemark)
      mapItem.name = name
      let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
      mapItem.openInMaps(launchOptions: options)
  }
}
