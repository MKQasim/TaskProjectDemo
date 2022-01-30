//
//  CustomTextField.swift
//  TaskProjectDemo
//
//  Created by Apple on 10/29/19.
//  //  Copyright © 2022 KamsQue. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications
import HealthKit
import CoreMotion



import UIKit

extension UITextField {

    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 10, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }

}
