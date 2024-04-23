//
//  RestaurantsMapPresenterProtocol.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation
import CoreLocation

protocol RestaurantsMapPresenterProtocol: PresenterProtocol {
    func didSelectAnnotation(coordinate: CLLocationCoordinate2D?)
}
