//
//  RestaurantsMapChildPresenterProtocol.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

protocol RestaurantsMapChildPresenterProtocol {
    func setRestaurantsInfoModel(_ model: RestaurantsInfoModel?,
                                 userLocation: LocationModel)
}
