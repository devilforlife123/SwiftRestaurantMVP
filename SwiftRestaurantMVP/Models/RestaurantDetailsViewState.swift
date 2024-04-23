//
//  RestaurantDetailsViewState.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation

enum RestaurantDetailsViewState:Equatable {
  case clear
  case render(viewModel:ViewModel)

  struct ViewModel:Equatable {
    let name:String
    let address:String
    let status:String
    let imageData:Data?
  }
}
