//
//  PresenterProtocol.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation

protocol PresenterProtocol {
    func viewLoaded()
    func viewAppeared()
}

extension PresenterProtocol {
    func viewLoaded() {}
    func viewAppeared() {}
}
