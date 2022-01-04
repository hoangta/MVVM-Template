//
//  LoginViewModel.swift
//  MVVMTemplate
//
//  Created by hoangta on 04/01/2022.
//

import Foundation

final class LoginViewModel: NSObject {
  var presentOTP: ((_ userName: String) -> Void)!

  //
  func login(userName: String, password: String) {
    let authen = Authen(userName: userName, password: password)
    // Some networking here...
    print(authen)

    // Present OPT when done
    presentOTP(userName)
  }
}
