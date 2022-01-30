//
//  LoginModel.swift
//  TaskProjectDemo
//
// Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//  Copyright © 2022 KamsQue. All rights reserved.
//

import Foundation

class LoginModel : Response{
    var code        :   Int?
    var message     :   String?
    var result      :   [String:ServerUser]?
}

struct ServerUser:Codable {
    var id: Int?
    var firstname   : String?
    var lastname    : String?
    var token       : String?
    var email       : String?
    var gender      : String?
    var dateOfBirth : String?
}

struct User:Codable {
    var userId: Int?
    var id: Int?
    var firstname   : String?
    var lastname    : String?
    var token       : String?
    var email       : String?
    var gender      : String?
    var dateOfBirth : String?
    var completed   :Bool?
    
    init(serverUser:ServerUser,completed:Bool?){
        self.id          = serverUser.id
        self.userId      = serverUser.id
        self.firstname   = serverUser.firstname
        self.lastname    = serverUser.lastname
        self.token       = serverUser.token
        self.email       = serverUser.email
        self.gender      = serverUser.gender
        self.dateOfBirth = serverUser.dateOfBirth
        self.completed   = completed
    }
}
