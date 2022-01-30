//
//  Enviroment.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//


import Foundation

enum Environment {

    case development
    case staging
    case production

    func baseURL() -> String {
        return "\(urlProtocol())://\(subdomain()).\(domain())\(route())"
    }

    func urlProtocol() -> String {
        switch self {
        case .production:
            return "https"
        default:
            return "https"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development:
            return "api"
        case .staging:
            return "test.subdomain"
        case .production:
            return "prod.subdomain"
        }
    }
    
    func domain() -> String {
        switch self {
        case .development, .staging, .production:
            return "nytimes.com"
        }
    }

    func route() -> String {
        return "/svc/mostpopular/v2/emailed/7.json?"
    }
}

extension Environment {
    func host() -> String {
        print("\(self.subdomain()).\(self.domain())")
        return "\(self.subdomain()).\(self.domain())"
    }
}


// MARK:- APIs

#if DEBUG
let environment: Environment = Environment.development
#else
let environment: Environment = Environment.staging
#endif

let baseUrl = environment.baseURL()

struct Path {
    struct User {
        var login: String { return "\("https://5fd312718cee610016adfe31.mockapi.io/api/v1/login")" }
    }

    struct Posts {
        var getMostViewedPosts : (String) -> String = { api_Key  in
            return "\(baseUrl)api-key\(String(api_Key))"
        }
    }
}

/*

 baseUrl

 Path().login

 Path.User().getProfile

 Path.User().deleteUser(525)

 Path.User.Task().getTaskDetail(525, 2)

 */
