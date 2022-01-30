//
//  KQItemDetailsRouter.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 30/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol KQItemDetailsRoutingLogic
{
  func routeToItemDetails(segue: UIStoryboardSegue?)
}

protocol KQItemDetailsDataPassing
{
  var dataStore: KQItemDetailsDataStore? { get }
}

class KQItemDetailsRouter: NSObject, KQItemDetailsRoutingLogic, KQItemDetailsDataPassing
{
  weak var viewController: KQItemDetailsViewController?
  var dataStore: KQItemDetailsDataStore?
  
  // MARK: Routing
  
    func routeToItemDetails(segue: UIStoryboardSegue?) {

        guard let destinationVC = AppLocalNetworkRoutes.getItemDetialsView() as? KQItemDetailsViewController else{return}
        guard let destinationRouter = destinationVC.router else {return}
        guard var destinationDS = destinationRouter.dataStore else {return}
        guard let sourceDS = dataStore else {return}

//        passDataToSomewhere(source: sourceDS as! KQHomeDataStore, destination: &destinationDS)
//        navigateToSomewhere(source: viewController!, destination: destinationVC)
    }
    
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
//
//    func routeToSkip(segue: UIStoryboardSegue?) {
//        guard let destinationVC = Storyboard.instatiate(view: KQHomeViewController.self) else{return}
//        guard let destinationRouter = destinationVC.router else {return}
//        guard var destinationDS = destinationRouter.dataStore else {return}
//        guard let sourceDS = dataStore else {return}
//
//        passDataToSomewhere(source: sourceDS, destination: &destinationDS)
//        navigateToSomewhere(source: viewController!, destination: destinationVC)
//    }

    // MARK: Navigation

    func navigateToSomewhere(source: KQHomeViewController, destination: KQItemDetailsViewController)
    {
        source.show(destination, sender: nil)
    }

    // MARK: Passing data

    func passDataToSomewhere(source: KQHomeDataStore, destination: inout KQItemDetailsDataStore)
    {
        destination.post    = source.selectedPost
    }
}