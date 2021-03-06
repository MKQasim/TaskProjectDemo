//
//  KQLoginRouter.swift
//  TaskProjectDemo
//
//  Created by Apple on 10/30/19.
//  Copyright (c) 2019 Apple. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol KQLoginRoutingLogic
{
    func routeToHome(segue: UIStoryboardSegue?)
    func routeToSkip(segue: UIStoryboardSegue?)
}

protocol KQLoginDataPassing
{
    var dataStore: KQLoginDataStore? { get }
}

class KQLoginRouter: NSObject, KQLoginRoutingLogic, KQLoginDataPassing
{


    weak var viewController: KQLoginViewController?
    var dataStore: KQLoginDataStore?

    // MARK: Routing

    func routeToHome(segue: UIStoryboardSegue?) {

        guard let destinationVC = AppLocalNetworkRoutes.getHomeView() as? KQHomeViewController else{return}
        guard let destinationRouter = destinationVC.router else {return}
        guard var destinationDS = destinationRouter.dataStore else {return}
        guard let sourceDS = dataStore else {return}

        passDataToSomewhere(source: sourceDS, destination: &destinationDS)
        navigateToSomewhere(source: viewController!, destination: destinationVC)
    }

    func routeToSkip(segue: UIStoryboardSegue?) {
        guard let destinationVC = Storyboard.instatiate(view: KQHomeViewController.self) else{return}
        guard let destinationRouter = destinationVC.router else {return}
        guard var destinationDS = destinationRouter.dataStore else {return}
        guard let sourceDS = dataStore else {return}

        passDataToSomewhere(source: sourceDS, destination: &destinationDS)
        navigateToSomewhere(source: viewController!, destination: destinationVC)
    }

    // MARK: Navigation

    func navigateToSomewhere(source: KQLoginViewController, destination: KQHomeViewController)
    {
        source.show(destination, sender: nil)
    }

    // MARK: Passing data

    func passDataToSomewhere(source: KQLoginDataStore, destination: inout KQHomeDataStore)
    {
//        destination.selectedPost = source.user
    }
}
