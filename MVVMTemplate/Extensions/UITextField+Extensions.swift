//
//  UITextField+Extensions.swift
//  MVVMTemplate
//
//  Created by hoangta on 04/01/2022.
//

import UIKit
import Combine

extension UITextField {
  func hasTextPublisher() -> AnyPublisher<Bool, Never> {
    NotificationCenter.default
      .publisher(for: UITextField.textDidChangeNotification, object: self)
      .map { ($0.object as? UITextField)?.hasText ?? false }
      .eraseToAnyPublisher()
  }
}
