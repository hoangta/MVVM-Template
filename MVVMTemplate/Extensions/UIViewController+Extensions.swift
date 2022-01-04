//
//  UIViewController+Extensions.swift
//  MVVMTemplate
//
//  Created by hoangta on 04/01/2022.
//

import UIKit

extension UIViewController {
  /// Factory method that makes view controller from storyboard
  static func instantiate() -> Self {
    let name = String(describing: self).replacingOccurrences(of: "ViewController", with: "")
    let storyboard = UIStoryboard(name: name, bundle: nil)
    let initial = storyboard.instantiateInitialViewController()
    guard let controller = initial as? Self else {
      fatalError("Could not create \(name), please check your storyboard again.")
    }
    return controller
  }
}
