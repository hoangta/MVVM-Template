//
//  HomeViewController.swift
//  MVVMTemplate
//
//  Created by hoangta on 04/01/2022.
//

import UIKit
import Combine

final class HomeViewController: UIViewController {
  let viewModel = HomeViewModel()

  @IBOutlet weak var tableView: UITableView!

  private var cancellables = Set<AnyCancellable>()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUIs()
    bindViewModel()
  }
}

// MARK: UIs
extension HomeViewController {
  private func setupUIs() {
    // More uis
    title = "Home"

    // Show log in button if not logged in.
    if viewModel.presentLogin != nil {
      navigationItem.rightBarButtonItem = .init(title: "Login", style: .plain, target: self, action: #selector(presentLogin))
    }

    // Shuffle
    navigationItem.leftBarButtonItem = .init(title: "Roll", style: .plain, target: self, action: #selector(shuffle))
  }
}

// MARK: Actions
extension HomeViewController {
  @objc private func presentLogin() {
    viewModel.presentLogin()
  }

  @objc private func shuffle() {
    viewModel.shuffle()
  }

  // Other IBActions..
}

// MARK: Bind ViewModel
extension HomeViewController {
  private func bindViewModel() {
    viewModel.items
      .sink { [unowned self] _ in
        tableView.reloadData()
      }
      .store(in: &cancellables)
  }
}

// MARK: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.items.value.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemViewCell", for: indexPath) as! ItemViewCell
    cell.setup(with: viewModel.items.value[indexPath.row])
    return cell
  }
}

// MARK: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel.presentDetail(viewModel.items.value[indexPath.row])
  }
}
