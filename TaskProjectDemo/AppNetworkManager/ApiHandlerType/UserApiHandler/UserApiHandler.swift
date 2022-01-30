//
//  UserApiHandelers.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import Foundation

struct LoginApiHandler: APIHandler {

    func makeRequest(from parameters: [String: Any]) -> Request {
        // prepare url
        let url = URL(string: Path.User().login)
        var urlRequest = URLRequest(url: url!)
        // set http method type
        urlRequest.httpMethod = "POST"
        // set body params
        set(parameters, urlRequest: &urlRequest)
        // prepares request (sets header params, any additional configurations)
        let request = Request(urlRequest: urlRequest, requestBuilder: DefaultRequest())
        return request
    }

    func parseResponse(data: Data) throws -> LoginModel? {
        return try defaultParseResponse(data: data)
    }
}

