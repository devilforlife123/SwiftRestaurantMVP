//
//  ViewProtocol.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation
import UIKit

protocol ViewProtocol: StoryboardInstantiable {}

protocol StoryboardInstantiable:AnyObject {
  static var storyboard:UIStoryboard { get }
  static var storyboardName:String { get }
  static var viewControllerIdentifier:String { get }
  static var storyboardBundle:Bundle { get }
}

extension StoryboardInstantiable {
    static var storyboard: UIStoryboard {
        UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    }

    static var storyboardBundle: Bundle {
        Bundle(for: self)
    }

    static var viewControllerIdentifier: String {
        String(describing: self)
    }

    static var storyboardName: String {
        ""
    }
}

extension StoryboardInstantiable {
  static func instantiate() -> Self {
    let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
    guard let typedViewController = viewController as? Self else {
      fatalError("ViewController '\(viewControllerIdentifier)' of '\(storyboard)' is not of class '\(self)'")
    }
    return typedViewController
  }
}
