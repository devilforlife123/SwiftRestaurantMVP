//
//  UIVIewController+Extension.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation
import UIKit

extension UIViewController {
   func add(_ child: UIViewController) {
       addChild(child)
       view.insertSubview(child.view, at: 0)
       child.didMove(toParent: self)
   }

   func removeChildFromParent() {
       guard parent != nil else {
           return
       }
       willMove(toParent: nil)
       removeFromParent()
       view.removeFromSuperview()
   }
}
