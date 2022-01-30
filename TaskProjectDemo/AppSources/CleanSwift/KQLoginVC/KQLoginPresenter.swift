//
//  KQLoginPresenter.swift
//  TaskProjectDemo
//
//  Created by Apple on 10/30/19.
//  Copyright (c) 2019 Apple. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol KQLoginPresentationLogic
{
    func presentSomething(response: KQLogin.Something.Response)
    func presentHome()
    func presentSkip()
}

class KQLoginPresenter: KQLoginPresentationLogic
{
  weak var viewController: KQLoginDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: KQLogin.Something.Response)
  {
   if response.success{
        guard let result = response.userLogin.result else {return}
        guard let user = result.values.first else {return}
        let newUser = User(serverUser: user, completed: true)
        let viewModel = KQLogin.Something.ViewModel(user:newUser)
        viewController?.displaySomething(viewModel: viewModel)
    }else{

    }
  }
    func presentHome() {
        viewController?.displayHome()
    }

    func presentSkip() {
        viewController?.displaySkip()
    }
}
