//
//  KQHomeInteractor.swift
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol KQHomeBusinessLogic
{
    func homeApiCall(request: KQHome.Api.Request)
}

protocol KQHomeDataStore
{
    var homeList: HomeModel? { get set }
    var selectedPost : Post? { get set }
}

class KQHomeInteractor: KQHomeBusinessLogic, KQHomeDataStore
{
    var selectedPost: Post?
    var homeList: HomeModel?
    var presenter: KQHomePresentationLogic?
    var worker: KQHomeWorker?
    var homeBusiness = HomeBusiness()
    
    // MARK: Home Api Call
    
    func homeApiCall(request: KQHome.Api.Request) {
        let parameters = ["api-key": "=NklDh6oq4hHAAK1v8nH8j3Ggc1PagBZG"]
        
        self.homeBusiness.homeApiCall(parameters: parameters, completion: {(home, error) in
            self.worker = KQHomeWorker()
            let response = KQHome.Api.Response( homeModel: home)
            self.presenter?.displayonScreen(response: response)
        })
    }
    
    
    
    
    
    
 
    
}

