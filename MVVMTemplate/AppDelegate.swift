//
//  AppDelegate.swift
//  MVVMTemplate
//
//  Created by hoangta on 04/01/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  private var homeCoordinator: HomeCoordinator?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    setupRootView()
    return true
  }

  private func setupRootView() {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()

    homeCoordinator = HomeCoordinator()
    window?.rootViewController = homeCoordinator!.navigationController
    homeCoordinator!.start()
  }
}
