//
//  UserBusiness.swift
//  TaskProjectDemo
//
// Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//  //  Copyright © 2022 KamsQue. All rights reserved.
//

import Foundation

class UserBusiness {
    // MARK: - UserServices
    private lazy var userServices = UserServices()
    
    // MARK: - Login
    
    func login(parameters: [String : Any],completion:@escaping((_ message:LoginModel?,_ error:Error?) -> ())){
        userServices.loginUser(parameters: parameters) { (userModel, error) in
            
            if error == nil{
                completion(userModel,error)
//                guard let serverUser = userModel?.result?["user"] else{return}
//                let user = User.init(serverUser: serverUser, completed: true)
//                print(user.firstname)
            }else{
                print("Error")
            }
        }
    }
}
