//
//  RestaurantTableViewCell.swift
//  SwiftRestaurantMVP
//
//  Created by suraj poudel on 24/4/2024.
//

import Foundation
import UIKit

final class RestaurantTableViewCell: UITableViewCell {
  @IBOutlet private weak var restaurantImageView: UIImageView!
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var statusLabel: UILabel!
  
  static let identifier = String(describing: RestaurantTableViewCell.self)

  override func didMoveToSuperview() {
      super.didMoveToSuperview()
      layoutIfNeeded()
  }

  func setup(viewModel: RestaurantCellViewModel) {
      restaurantImageView.image = nil
      if let url = viewModel.imageURL {
          restaurantImageView.downloadAndShowImage(url: url)
      }
      nameLabel.text = viewModel.name
      if let statusString = viewModel.status {
          statusLabel.isHidden = false
          statusLabel.text = statusString
      } else {
          statusLabel.isHidden = true
      }
  }

  
}
