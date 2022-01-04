//
//  HomeViewModel.swift
//  MVVMTemplate
//
//  Created by hoangta on 04/01/2022.
//

import Foundation
import Combine

final class HomeViewModel: NSObject {
  var presentLogin: (() -> Void)!
  var presentDetail: ((String) -> Void)!

  let items = CurrentValueSubject<[String], Never>(["Item 1", "Item 2", "Item 3"])

  func shuffle() {
    let range = 1...Int.random(in: 2...10)
    let items = range.map { "Item \($0)" }
    self.items.send(items)
  }
}

/* Input/Output pattern
extension HomeViewModel {
  struct Input {
    let shuffle: AnyPublisher<Void, Never>
    let presentLogin: AnyPublisher<Void, Never>
    let presentDetail: AnyPublisher<String, Never>
  }

  struct Output {
    let items: AnyPublisher<Void, Never>
  }

  func transform(input: Input) -> Output {
    input.presentLogin
      .sink { [self] in presentLogin() }
      .store(in: &cancellables)

    input.presentDetail
      .sink { [self] userName in presentDetail(userName) }
      .store(in: &cancellables)

    let items = input.shuffle
      .map {
        let range = 1...Int.random(in: 2...10)
        return range.map { "Item \($0)" }
      }

    return Output(items: items)
  }
}
*/
