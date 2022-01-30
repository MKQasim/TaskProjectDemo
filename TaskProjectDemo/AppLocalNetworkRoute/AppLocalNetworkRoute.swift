//
//  AppLocalNetworkRoute.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import Foundation
import UIKit


enum Storyboard: String {

    case launchScreenStory = "LaunchScreen"
    case loginStoryboard = "KQLoginStory"
    case homeStoryBoard = "KQHomeStory"
    case itemDetailsStoryBoard = "KQItemDetailsStory"

    var storyboard:UIStoryboard{
        return UIStoryboard.init(name: self.rawValue, bundle: nil)
    }
    static func instatiate<T>(view:T.Type)->T?{
        let view = "\(view)"
        let storyboard = UIStoryboard.init(name: view, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: view) as? T
    }
}

class AppLocalNetworkRoutes: NSObject {

    private static let launchScreenStoryboard = UIStoryboard(name: Storyboard.launchScreenStory.rawValue, bundle: nil)
    private static let loginStoryboard = UIStoryboard(name: Storyboard.loginStoryboard.rawValue, bundle: nil)
    private static let homeStoryBoard = UIStoryboard(name: Storyboard.homeStoryBoard.rawValue, bundle: nil)
    private static let itemDetailsStoryBoard = UIStoryboard(name: Storyboard.itemDetailsStoryBoard.rawValue, bundle: nil)


    static func getLoginVC() -> UIViewController {
        return loginStoryboard.instantiateViewController(withIdentifier: "KQLoginViewController") as! KQLoginViewController
    }

    static func getHomeView() -> UIViewController {
        return homeStoryBoard.instantiateViewController(withIdentifier: "KQHomeViewController") as! KQHomeViewController
    }
    
    static func getItemDetialsView() -> UIViewController {
        return itemDetailsStoryBoard.instantiateViewController(withIdentifier: "KQItemDetailsViewController") as! KQItemDetailsViewController
    }

}


