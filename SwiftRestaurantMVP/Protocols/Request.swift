//
//  Request.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

enum RequestType {
    case get
}

protocol Request {
  var type:RequestType { get }
  var path:String { get }
  var params:[String:Any]? { get }
}
