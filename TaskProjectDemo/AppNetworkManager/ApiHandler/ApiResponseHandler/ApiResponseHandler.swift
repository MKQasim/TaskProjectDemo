//
//  ApiResponseHandler.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import Foundation

protocol ResponseHandler {

        associatedtype ResponseDataType:Decodable

     func parseResponse(data: Data) throws -> ResponseDataType?
}

// MARK: - Response
protocol Response: Codable {
    var code: Int?{get set}
    var message: String?{get set}
}

