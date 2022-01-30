//
//  File.swift
//  TaskProjectDemo
//
//  Created by Apple on 28/01/2022.
//  //  Copyright © 2022 KamsQue. All rights reserved.
//

import Foundation
import UIKit

public typealias AlertButtonTappedAction = (Int,String) -> Void;

public class AlertHelper: NSObject, UIAlertViewDelegate, UIActionSheetDelegate {

    public static let sharedHelper = AlertHelper()
    fileprivate var currentVC: UIViewController!
//    public func alertView(_ alertView: UIAlertController, clickedButtonAt buttonIndex: Int) {
//        if let handler = alertButtonTappedHandler {
//            handler(buttonIndex)
//            alertButtonTappedHandler = nil
//        }
//    }




    public func actionSheet(_ actionSheet: UIAlertController, clickedButtonAt buttonIndex: Int) {
        if let handler = alertButtonTappedHandler {

            handler(buttonIndex, self.buttonTitle(at: buttonIndex) ?? "")
            alertButtonTappedHandler = nil
        }
    }


    open func buttonTitle(at buttonIndex: Int) -> String?{
        return buttonTitle(at: buttonIndex)
    }

//       func showActionSheet(vc: UIViewController , gallery:Bool) {
//            currentVC = vc
//            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//
//            actionSheet.addAction(UIAlertAction(title: "Kamera", style: .default, handler: { (alert:UIAlertAction!) -> Void in
//
//
//
//            }))
//
//        actionSheet.addAction(UIAlertAction(title: "Annullera", style: .cancel, handler: nil))
//
//        vc.present(actionSheet, animated: true, completion: nil)
//        }

    private override init() {}
    private var alertButtonTappedHandler: AlertButtonTappedAction?
    func setButtonTappedHandler(action: AlertButtonTappedAction?) {
        alertButtonTappedHandler = action
    }

}

