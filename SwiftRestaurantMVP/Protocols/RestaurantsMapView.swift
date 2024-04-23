//
//  RestaurantsMapView.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

protocol RestaurantsMapView: ViewProtocol {
    var presenter: RestaurantsMapPresenterProtocol! { get set }
    func changeViewState(viewState: RestaurantsMapViewState)
}
