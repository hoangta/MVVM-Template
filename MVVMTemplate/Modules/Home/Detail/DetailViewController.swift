//
//  DetailViewController.swift
//  MVVMTemplate
//
//  Created by hoangta on 04/01/2022.
//

import UIKit

final class DetailViewController: UIViewController {
  let viewModel = DetailViewModel()

  @IBOutlet weak var contentLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUIs()
  }
}

// MARK: UIs
extension DetailViewController {
  private func setupUIs() {
    contentLabel.text = viewModel.item
  }
}
