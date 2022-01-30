//
//  UserBusiness.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import Foundation

class HomeBusiness {
     // MARK: - HomeServices
    private lazy var homeServices = HomeServices()

    // MARK: - Home Api Call

    func homeApiCall(parameters: [String : Any],completion:@escaping((_ message:HomeModel?,_ error:Error?) -> ())){
        homeServices.postList(parameters: parameters) { homeModel, error in
            if error == nil{
                completion(homeModel,error)
            }else{
                print(error?.localizedDescription)
            }
        }
    }
}
