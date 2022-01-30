//
//  ApiRequestHandler.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import Foundation

protocol RequestHandler {

    associatedtype RequestDataType

    func makeRequest(from data: RequestDataType) -> Request
}

// MARK: - SetParameters

extension RequestHandler {

    /// prepares httpbody
    func set(_ parameters: [String: Any], urlRequest: inout URLRequest) {
        // http body
        if parameters.count != 0 {
            if let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: .withoutEscapingSlashes) {
                urlRequest.httpBody = jsonData
            }
        }
    }
}
