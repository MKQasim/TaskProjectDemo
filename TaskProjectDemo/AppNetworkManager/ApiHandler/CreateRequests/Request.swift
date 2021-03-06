//
//  Request.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import Foundation


class Request {

    private var request: URLRequest

    init(urlRequest: URLRequest, requestBuilder: RequestBuilder) {
        self.request = urlRequest
        // do configuration
        requestBuilder.setHeaders(request: &self.request)
    }

    var urlRequest: URLRequest {
        return request
    }
}






