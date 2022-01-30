//
//  KQHomeModels.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

//enum KQHome
//{
//  // MARK: Use cases
//
//  enum Something
//  {
//    struct Request
//    {
//    }
//    struct Response
//    {
//    }
//    struct ViewModel
//    {
//    }
//  }
//}

enum KQHome
{
  // MARK: Use cases

  enum Something
  {
    struct Request
    {
        var api_key : String
        var value   : String
    }
      // MARK: - Home
      struct Response {
          var code: Int?
          var message: String?
          var homeModel : HomeModel?
      }
      
    struct ViewModel
    {
        var homeModel: [Post]?
    }
  }
}
