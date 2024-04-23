//
//  UIImageView+Extension.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation
import UIKit

extension UIImageView {
  func downloadAndShowImage(url: URL) {
      let urlRequest = URLRequest(url: url)
      URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
          guard error == nil, let data = data else {
              return
          }
          DispatchQueue.main.async {
              self.image = nil
          }
          let image = UIImage(data: data)
          DispatchQueue.main.async { [weak self] in
              self?.image = image
          }
      }.resume()
  }
}
