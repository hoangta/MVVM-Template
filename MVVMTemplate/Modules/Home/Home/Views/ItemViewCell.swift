//
//  ItemViewCell.swift
//  MVVMTemplate
//
//  Created by hoangta on 04/01/2022.
//

import UIKit

final class ItemViewCell: UITableViewCell {
  func setup(with item: String) {
    textLabel?.text = item
  }
}
