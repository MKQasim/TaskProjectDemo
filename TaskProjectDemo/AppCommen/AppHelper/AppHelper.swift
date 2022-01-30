//
//  AppHelper.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import Foundation

class AppHelper {
}

extension AppHelper {
}


struct Defaults {

    static let (userIdKey, authTokenKey) = ("userId", "token")
    static let userSessionKey = "com.save.usersession"
    private static let userDefault = UserDefaults.standard

    /**
       - Description - It's using for the passing and fetching
                    user values from the UserDefaults.
     */
    struct UserDetails {
        let userId: String
        let authToken: String

        init(_ json: [String: String]) {
            self.userId = json[userIdKey] ?? ""
            self.authToken = json[authTokenKey] ?? ""
        }
    }

    /**
     - Description - Saving user details
     - Inputs - name `String` & address `String`
     */
    static func save(_ userID: String, authToken: String){
        userDefault.set([userIdKey: userID, authTokenKey: authToken],
                        forKey: userSessionKey)
    }

    /**
     - Description - Fetching Values via Model `UserDetails` you can use it based on your uses.
     - Output - `UserDetails` model
     */
    static func getUserIdAndAuthToken()-> UserDetails {
        return UserDetails((userDefault.value(forKey: userSessionKey) as? [String: String]) ?? [:])
    }

    /**
        - Description - Clearing user details for the user key `com.save.usersession`
     */
    static func clearUserData(){
        userDefault.removeObject(forKey: userSessionKey)
    }
}
