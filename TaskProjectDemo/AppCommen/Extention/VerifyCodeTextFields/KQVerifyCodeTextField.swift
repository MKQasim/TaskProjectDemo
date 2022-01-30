//
//  KQVerifyCodeTextField.swift
//  TaskProjectDemo
//
//  Created by Apple on 28/01/2022.
//  //  Copyright © 2022 KamsQue. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

protocol DeletableVerificationDigits:SkyFloatingLabelTextFieldWithIcon {
    var hasDeleted:((SkyFloatingLabelTextFieldWithIcon)->Void)? { get set }
}

class KQVerifyCodeTextField:SkyFloatingLabelTextFieldWithIcon,DeletableVerificationDigits,UITextFieldDelegate{

    var hasDeleted: ((SkyFloatingLabelTextFieldWithIcon) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
    }
    override func deleteBackward() {
        self.hasDeleted?(self)
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Should I?")
        if let characterCount = textField.text?.count, characterCount == 0{
            return true
        }
        return false
    }
}
