//
//  LoginViewController.swift
//  MVVMTemplate
//
//  Created by hoangta on 04/01/2022.
//

import UIKit
import Combine

final class LoginViewController: UIViewController {
  let viewModel = LoginViewModel()
  
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!

  private var cancellables = Set<AnyCancellable>()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUIs()
  }
}

// MARK: UIs
extension LoginViewController {
  private func setupUIs() {
    // Enable login when there are any userName & password
    loginButton.isEnabled = false
    Publishers.CombineLatest(userNameTextField.hasTextPublisher(), passwordTextField.hasTextPublisher())
      .map { $0 && $1}
      .sink(receiveValue: { [unowned self] flag in
        loginButton.isEnabled = flag
      })
      .store(in: &cancellables)
  }
}

// MARK: Actions
extension LoginViewController {
  @IBAction private func login() {
    viewModel.presentOTP(userNameTextField.text!)
  }
}
