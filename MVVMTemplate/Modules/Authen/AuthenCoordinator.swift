//
//  AuthenCoordinator.swift
//  MVVMTemplate
//
//  Created by hoangta on 04/01/2022.
//

import UIKit

final class AuthenCoordinator: Coordinator {
  let navigationController: UINavigationController

  // This will be trigged when authen flow is done
  let completion: () -> Void

  private var userName: String?

  init(navigationController: UINavigationController = .init(), completion: @escaping () -> Void) {
    self.navigationController = navigationController
    self.completion = completion
  }

  func start() {
    let login = LoginViewController.instantiate()
    login.viewModel.presentOTP = { [weak self] userName in
      /// We cache `userName` instead of passing it directly to `presentOTP:` to demonstrate that it can be used later,
      /// such as passing it to another scene after OTP or another coordinator
      self?.userName = userName
      
      self?.presentOTP()
    }
    navigationController.pushViewController(login, animated: true)
  }
}

// MARK: Navigations
extension AuthenCoordinator {
  private func presentOTP() {
    let otp = OTPViewController.instantiate()
    otp.viewModel.userName = userName
    otp.viewModel.presentHome = { [weak self] in self?.completion() }
    navigationController.pushViewController(otp, animated: true)
  }
}
