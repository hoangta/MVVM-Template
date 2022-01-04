//
//  OTPViewController.swift
//  MVVMTemplate
//
//  Created by hoangta on 04/01/2022.
//

import UIKit

final class OTPViewController: UIViewController {
  let viewModel = OTPViewModel()

  @IBOutlet weak var greetingLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUIs()
  }
}

// MARK: UIs
extension OTPViewController {
  private func setupUIs() {
    greetingLabel.text = "Hi \(viewModel.userName!)!"
  }
}

// MARK: Actions
extension OTPViewController {
  @IBAction private func submit() {
    viewModel.presentHome()
  }
}
