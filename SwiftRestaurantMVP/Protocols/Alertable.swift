//
//  Alertable.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 23/4/2024.
//

import Foundation
import UIKit

protocol Alertable {}

extension Alertable where Self: UIViewController {
    func showAlert(title: String = "",
                   actionTitle: String,
                   message: String,
                   preferredStyle: UIAlertController.Style = .alert,
                   actionHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: actionHandler))
        self.present(alert, animated: true, completion: nil)
    }
}
