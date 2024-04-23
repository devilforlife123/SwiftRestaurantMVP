//
//  GetRestaurantImageDataParams.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation

struct GetRestaurantImageDataParams {
    typealias Completion = (Result<Data, UseCaseError>) -> Void

    let imageReference: String
    let completion: Completion
}
