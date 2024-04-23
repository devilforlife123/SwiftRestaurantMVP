//
//  Status.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

enum Status:String,Decodable {
  case success = "OK"
  case requestDenied = "REQUEST_DENIED"
  case invalidRequest = "INVALID_REQUEST"
}

