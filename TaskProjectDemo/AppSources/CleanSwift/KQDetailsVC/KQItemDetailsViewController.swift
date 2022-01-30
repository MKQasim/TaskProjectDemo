//
//  KQItemDetailsViewController.swift
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

protocol KQItemDetailsDisplayLogic: class
{
    func displayItemDetails(viewModel: KQItemDetails.Something.ViewModel)
}

class KQItemDetailsViewController: UIViewController, KQItemDetailsDisplayLogic
{
    var interactor: KQItemDetailsBusinessLogic?
    var router: (NSObjectProtocol & KQItemDetailsRoutingLogic & KQItemDetailsDataPassing)?
    
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
        let interactor = KQItemDetailsInteractor()
        let presenter = KQItemDetailsPresenter()
        let router = KQItemDetailsRouter()
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
        profileImageView.roundCorners(corners: .allCorners, radius: profileImageView.frame.width/2)
        profileImageView.contentMode = .scaleToFill
        doSomething()
    }
    
    // MARK: Do something
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var publishedDateLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var updatedDateLbl: UILabel!
    @IBOutlet weak var sectionLbl: UILabel!
    @IBOutlet weak var TypeLbl: UILabel!
    @IBOutlet weak var ByLineLbl: UILabel!
    func doSomething()
    {
        let request = KQItemDetails.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displayItemDetails(viewModel: KQItemDetails.Something.ViewModel)
    {
        configureDetails(post: viewModel.post)
    }
    
    func configureDetails(post:Post?){
        titleLbl.text = post?.title
        sourceLbl.text = post?.source
        publishedDateLbl.text = post?.publishedDate
        sectionLbl.text      = post?.section
        updatedDateLbl.text = post?.updated
        ByLineLbl.text = post?.byline
        TypeLbl.text = post?.perFacet?.first?.description.components(separatedBy: ",").first
        let url = URL(string: (post?.media?.first?.mediaMetadata?.first?.url)!)!
        self.profileImageView.load(url: url)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
