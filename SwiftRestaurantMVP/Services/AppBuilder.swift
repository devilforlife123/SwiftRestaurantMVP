//
//  AppBuilder.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

final class AppBuilder {
    func buildRestaurantsParent() -> RestaurantsParentBuilder  {
        return RestaurantsParentBuilder()
    }
}
