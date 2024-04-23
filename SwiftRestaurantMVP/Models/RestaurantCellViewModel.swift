//
//  RestaurantsCellViewModel.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation

struct RestaurantCellViewModel: CellViewModel, Equatable {
    let imageURL: URL?
    let name: String
    let status: String?
}
