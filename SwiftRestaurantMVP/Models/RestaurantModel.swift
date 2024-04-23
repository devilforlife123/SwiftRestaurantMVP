//
//  LocationModel.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation
import CoreLocation

struct RestaurantModel: Equatable {
    let name: String
    let imageURL: URL?
    let openStatus: Bool?
    let locationModel: LocationModel
    let address: String?
    let photoReference: String?
}

struct LocationModel:Equatable {
  let latitude:Double
  let longitude:Double
}

extension LocationModel {
    init(coordinates: CLLocationCoordinate2D) {
        self.longitude = coordinates.longitude
        self.latitude = coordinates.latitude
    }
}
