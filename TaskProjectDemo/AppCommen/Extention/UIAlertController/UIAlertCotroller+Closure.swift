//
//  UIAlertCotroller+Closure.swift
//  AlertHelper-Swift
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
public extension UIAlertController {
    
    public static func show(style: UIAlertController.Style = .alert,
                            viewController: UIViewController,
                            sourceRect: CGRect? = nil,
                            title: String? = nil,
                            message: String? = nil,
                            destructiveButtonTitle: String? = nil,
                            cancelButtonTitle: String? = nil,
                            otherButtonTitles: [String]? = nil,
                            buttonTappedHandler: AlertButtonTappedAction? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        if let destructiveButtonTitle = destructiveButtonTitle {
            let action = UIAlertAction(title: destructiveButtonTitle, style: .destructive, handler: { (UIAlertAction) in
                buttonTappedHandler?(0, title ?? "")
            })
            alertController.addAction(action)
        }
        
        if let cancelButtonTitle = cancelButtonTitle {
            let action = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: { (UIAlertAction) in
                if destructiveButtonTitle != nil {
                    buttonTappedHandler?(-1,title ?? "")
                } else {
                    buttonTappedHandler?(0, title ?? "")
                }
            })
            alertController.addAction(action)
        }
        
        if let otherButtonTitles = otherButtonTitles {
            for (index, title) in otherButtonTitles.enumerated() {
                
                let action = UIAlertAction(title: title, style: .default, handler: { (UIAlertAction) in
                    if destructiveButtonTitle != nil && cancelButtonTitle != nil {
                        buttonTappedHandler?(index, title)
                    } else if destructiveButtonTitle == nil && cancelButtonTitle == nil {
                        buttonTappedHandler?(index, title)
                    } else {
                        buttonTappedHandler?(index, title)
                    }
                })
                alertController.addAction(action)
            }
        }
        
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = viewController.view
            if let sourceRect = sourceRect {
                popoverController.sourceRect = sourceRect
            } else {
                let size = viewController.view.bounds.size
                popoverController.sourceRect = CGRect(x: size.width/2, y: size.height - 2, width: 0, height: 2)
            }
        }
        
        viewController.present(alertController, animated: true, completion: nil)
    }
}
