//
//  KQHomeViewController.swift
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
import AVFoundation

protocol KQHomeDisplayLogic: class
{
    func displayHomeList(viewModel: KQHome.Api.ViewModel)
}

class KQHomeViewController: UIViewController, KQHomeDisplayLogic
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet open weak var navbarView: KQNavBar?
    var interactor: KQHomeBusinessLogic?
    var router: (NSObjectProtocol & KQHomeRoutingLogic & KQHomeDataPassing)?
    var homeList : [Post]?
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
        
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = KQHomeInteractor()
        let presenter = KQHomePresenter()
        let router = KQHomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        homeApiRequestCall()
        tableViewinit()
        setUpNavActions()
    }
    
    func setUpNavActions(){
        let action = navbarView?.navBarAction = { actiontype in
            switch  ActionType(rawValue: actiontype.rawValue) {
                case .firstLeftButtonAction:print("menu firstLeftButtonAction");
                case .secondLeftButtonAction:print("2nd secondLeftButtonAction")
                case .rightFirstButtonAction:print("optional rightFirstButtonAction");
                case .rightSecondButtonAction:print("search rightSecondButtonAction")
            case .rightThirdButtonAction:print("more rightThirdButtonAction");
                default:print("No One")
            }
            return self
        }
    }
    // MARK: Home Api Request Call
    
    func homeApiRequestCall()
    {
        let request = KQHome.Api.Request(api_key: "api-key", value: AppShared.shared().token)
        interactor?.homeApiCall(request: request)
    }
    
    func displayHomeList(viewModel: KQHome.Api.ViewModel)
    {
        DispatchQueue.main.async() {
            self.homeList = viewModel.homeModel
            self.tableView.reloadData()
            print(viewModel.homeModel?.count)
        }
    }
    
    func displayItemDetails(post:Post?) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // your code here
            if var rout = self.router{
                print("Move to Home")
                rout.dataStore?.selectedPost = post
                rout.routeToItemDetails(segue: nil)
            }
        }
    }
}

extension KQHomeViewController :UITableViewDelegate , UITableViewDataSource{
    func tableViewinit() {
        tableView.register(UINib(nibName: KQHomeTableCell.Identifier, bundle: nibBundle.self), forCellReuseIdentifier:  KQHomeTableCell.Identifier)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: KQHomeTableCell.Identifier) as! KQHomeTableCell
        self.configureCell(cell: cell, post: homeList?[indexPath.row])
        return cell
    }
    
    func configureCell(cell: KQHomeTableCell , post:Post?){
        cell.titleLbl.text = post?.title
        cell.subTitleLbl.text = post?.byline
        cell.detailsLbl.text = post?.perFacet?.first?.description.components(separatedBy: ",").first
        cell.dateLbl.text = post?.publishedDate
        cell.profileImageView.roundCorners(corners: .allCorners, radius: cell.profileImageView.frame.width/2)
        cell.profileImageView.contentMode = .scaleToFill
        let url = URL(string: (post?.media?.first?.mediaMetadata?.first?.url)!)!
        cell.profileImageView.load(url: url)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        displayItemDetails(post: homeList?[indexPath.row])
        
    }
}
