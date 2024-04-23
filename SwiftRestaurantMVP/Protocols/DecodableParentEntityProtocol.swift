//
//  DecodableParentEntityProtocol.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

protocol DecodableParentEntityProtocol: Decodable {
    var status: Status? { get }
}
