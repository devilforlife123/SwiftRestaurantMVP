//
//  RestaurantsMapViewState.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation
import CoreLocation

enum RestaurantsMapViewState: Equatable {
    case clear
    case render(viewModel: ViewModel)

    struct ViewModel: Equatable {
        let userLocation: CLLocationCoordinate2D
        let restaurantsLocations: [LocationViewModel]
        let latitudeDelta: CLLocationDegrees
        let longitudeDelta: CLLocationDegrees
    }

    struct LocationViewModel: Equatable {
        let location: CLLocationCoordinate2D
        let title: String
        let subtitle: String
    }
}

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return (lhs.latitude == rhs.latitude) && (lhs.longitude == rhs.longitude)
    }
}
