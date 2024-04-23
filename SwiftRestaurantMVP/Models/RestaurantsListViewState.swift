//
//  RestaurantsListViewState.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation

enum RestaurantsListViewState: Equatable {
    case clear
    case loading
    case render(viewModel: ViewModel)

    struct ViewModel: Equatable {
        let rowsViewModels: [RestaurantCellViewModel]
    }
}
