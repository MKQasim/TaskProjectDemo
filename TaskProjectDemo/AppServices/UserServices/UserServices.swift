//
//  UserServices.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import Foundation

class UserServices {
         // MARK: - UserLogin
    func loginUser(parameters: [String: Any], completion: @escaping (LoginModel?, Error?) -> ()) {
        // api
        let api = LoginApiHandler()
        // api loader
        let apiTaskLoader = APILoader(apiRequest: api)

        apiTaskLoader.loadAPIRequest(requestData: parameters) { (result) in
            switch result{
            case  .success(let userModel):print("LoginSuccess")
                completion(userModel,nil)
            case .failure(let error):
                 completion(nil,error)
            }
        }
    }
}
