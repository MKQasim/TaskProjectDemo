//
//  AllergiesApiHandler.swift
//  TaskProjectDemo
//
//  Created by Apple on 10/30/19.
//  Copyright (c) 2019 Apple. All rights reserved.
//

import Foundation

struct HomeApiHandler: APIHandler {

    func makeRequest(from parameters: [String: Any]) -> Request {
        // prepare url
//        let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=NklDh6oq4hHAAK1v8nH8j3Ggc1PagBZG")
        
//    https://api.nytimes.comsvc/mostpopular/v2/emailed/7.json?api-key=NklDh6oq4hHAAK1v8nH8j3Ggc1PagBZG
        
        let url = URL(string:Path.Posts().getMostViewedPosts(AppShared.shared().token) )
        print(url)
        var urlRequest = URLRequest(url: url!)
        // set http method type
        urlRequest.httpMethod = "POST"
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
//        //HTTP Headers
//
        // set body params
        set(parameters, urlRequest: &urlRequest)
        // prepares request (sets header params, any additional configurations)
        let request = Request(urlRequest: urlRequest, requestBuilder: DefaultRequest())
        
        return request
    }
   
    func parseResponse(data: Data) throws -> HomeModel? {
    
        return try defaultParseResponse(data: data)
    }
}
