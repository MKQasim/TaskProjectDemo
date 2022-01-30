//
//  AuthRequest.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import Foundation


class AuthRequest: DefaultRequest {
    override func setHeaders(request: inout URLRequest) {

        super.setHeaders(request: &request)
//        let nameAndToken = Defaults.getUserIdAndAuthToken()
//        let token = "Bearer "+nameAndToken.authToken
//        print(token)
//        // Auth Headers
//        withoutEscapingSlashes
        request.setValue(nil, forHTTPHeaderField: "Authorization")
//        print(token)
    }
}
