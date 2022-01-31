//
//  KQItemDetailsPresenter.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 30/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol KQItemDetailsPresentationLogic
{
  func displayOnScreen(response: KQItemDetails.Screen.Response)
    
}

class KQItemDetailsPresenter: KQItemDetailsPresentationLogic
{
  weak var viewController: KQItemDetailsDisplayLogic?
  
  // MARK: Do something
  
  func displayOnScreen(response: KQItemDetails.Screen.Response)
  {
      let viewModel = KQItemDetails.Screen.ViewModel(post: response.post)
    viewController?.displayItemDetails(viewModel: viewModel)
  }
}
