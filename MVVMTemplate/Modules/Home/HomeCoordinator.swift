//
//  HomeCoordinator.swift
//  MVVMTemplate
//
//  Created by hoangta on 04/01/2022.
//

import UIKit

final class HomeCoordinator: Coordinator {
  let navigationController: UINavigationController

  private var authenCoordinator: Coordinator?

  init(navigationController: UINavigationController = .init()) {
    self.navigationController = navigationController
  }

  func start() {
    let home = HomeViewController.instantiate()
    home.viewModel.presentLogin = { [weak self] in self?.presentLogin() }
    home.viewModel.presentDetail = { [weak self] detail in self?.presentDetail(detail) }
    navigationController.pushViewController(home, animated: false)
  }
}

// MARK: Navigations
extension HomeCoordinator {
  private func presentLogin() {
    authenCoordinator = AuthenCoordinator(navigationController: navigationController) { [unowned self] in
      // Present home again after logging in, not setting `presentLogin` this time, results in hidding login button
      let home = HomeViewController.instantiate()
      home.viewModel.presentDetail = { [weak self] detail in self?.presentDetail(detail) }
      navigationController.setViewControllers([home], animated: true)
    }
    authenCoordinator?.start()
  }

  private func presentDetail(_ item: String) {
    let detail = DetailViewController.instantiate()
    detail.viewModel.item = item
    navigationController.pushViewController(detail, animated: true)
  }
}
