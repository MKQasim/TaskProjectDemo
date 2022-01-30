//
//  KQNavBar.swift
//  KQHamaraSchool
//
//  Created by muhammad on 12/9/20.
//

import UIKit

public enum ActionType : String{
    case firstLeftButtonAction
    case secondLeftButtonAction
    case rightFirstButtonAction
    case rightSecondButtonAction
    case rightThirdButtonAction
}

class KQNavBar: UIView {
    
    @IBOutlet public var navView: UIView!
    @IBOutlet public weak var firstLeftButton: UIButton!
    @IBOutlet public weak var secondLeftButton: UIButton!
    @IBOutlet public weak var titleImage: UIImageView!
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var rightFirstButton: UIButton!
    @IBOutlet public weak var rightSecondButton: UIButton!
    @IBOutlet public weak var rightThirdButton: UIButton!
    var navBarAction : ((_ actionType:ActionType)->(UIViewController))?
    var onCompletion : ((_ success: Bool) -> ())?
    var navBar = UIView()
    
    var myAppNavColor: UIColor =  .orange {
            didSet{
                
//                return UIColor(red: 0, green: 1, blue: 0, alpha: 1)
//                print("Called after setting the new value")
//                print("New name is \(myAppNavColor) and old name is \(String(describing: oldValue.name))")
//                setBackgroundchange(selected: UIColor.myAppThemeColor, navTitle: "")
            }
//            willSet(myNewValue) {
////                return UIColor(red: 0, green: 1, blue: 0, alpha: 1)
//                print("Called before setting the new value")
//                print("New name is \(myNewValue.name)")
//            }
        }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("KQNavBar", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    
    func setBackgroundchange(selected:UIColor,navTitle:String?){
        let when = DispatchTime.now() + 0.0
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.navView.backgroundColor = selected
           
            self.titleLabel.text = navTitle
        }
    }
    
    func setNavBackAction(){
        
        self.firstLeftButton.setImage(UIImage(named: "nav-back"), for: .normal)
       
    }
    
    func setNavDoneButtonTitle(){
        self.rightThirdButton.setImage(nil, for: .normal)
        self.rightThirdButton.setTitle("Done", for: .normal)
       
    }
    
    func firstLeftButtonAction(image : String){
        
        self.firstLeftButton.setImage(UIImage(named: image), for: .normal)
    }
    
//    func secondLeftButton(user : Student?){
//        self.imageDownload(imageView: UIImageView(), user: user ?? Student() ) { (status, image) in
//            print("Downloaded Image")
//            DispatchQueue.main.async {
//                self.secondLeftButton.setImage(image, for: .normal)
//            }
//        }
//    }
    
    func rightFirstButton(image : String){
        self.secondLeftButton.setImage(UIImage(named: image), for: .normal)
        
    }
    
    func rightSecondButton(image : String){
        self.rightSecondButton.setImage(UIImage(named: image), for: .normal)
      
    }
    
    func rightThirdButton(image : String){
        self.rightThirdButton.setImage(UIImage(named: image), for: .normal)
    }
    
    
    
    
    @IBAction func menuAction(_ sender: UIButton) {
        print("menu first Left Button")
        navBarAction?(ActionType.firstLeftButtonAction)
        
    }
    
    @IBAction func profileAction(_ sender: UIButton) {
        print("profile second Left Button")
        navBarAction?(ActionType.secondLeftButtonAction)
    }
    
    @IBAction func messageAction(_ sender: UIButton) {
        navBarAction?(ActionType.rightFirstButtonAction)
        print("chat right First Button")
    }
    
    @IBAction func notificationAction(_ sender: UIButton)
    {
        navBarAction?(ActionType.rightSecondButtonAction)
        print("notification right Second Button")
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        navBarAction?(ActionType.rightThirdButtonAction)
        print("search right Third Button")
    }
    
    
}
