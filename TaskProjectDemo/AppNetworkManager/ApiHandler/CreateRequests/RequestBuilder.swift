//
//  RequestBuilder.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import Foundation

protocol RequestBuilder {
    func setHeaders(request: inout URLRequest)
}
