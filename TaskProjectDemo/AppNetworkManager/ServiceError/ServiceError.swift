//
//  ErrorType.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import Foundation

// MARK: - Errors

struct ServiceError: Error, Codable {
    let httpStatus: Int
    let message: String
    let description: String?

}

struct NetworkError: Error {
    let message: String
}

struct UnknownParseError: Error { }


