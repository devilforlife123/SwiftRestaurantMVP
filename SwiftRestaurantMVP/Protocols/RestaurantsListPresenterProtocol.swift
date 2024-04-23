//
//  RestaurantsListPresenterProtocol.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation

protocol RestaurantsListPresenterProtocol:PresenterProtocol,TableViewDataSource {
  func didScrollBeyondCurrentPage()
  func didSelectRow(indexPath: IndexPath)
}

