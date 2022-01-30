//
//  AppTheme.swift
//  TaskProjectDemo
//  TaskProjectDemo
//
//  Created by Muhammad Qasim Muhammad Mubeen on 28/01/2022.
//

import Foundation
import UIKit

enum AppTheme {

    struct AppTheme1{

        struct LoginScreen {
            struct TextField{
                static let activeTitleColor = UIColor.clear
                static let passsiveTitleColor = UIColor.clear
                static let tintColor = UIColor.init(hexString: "A2A2A2")
                static let placeHolderColor = UIColor(hexString: "A5A5A5")
                static let textColor = UIColor(hexString: "000000")
                static let passiveBorderColor = UIColor.init(hexString: "A2A2A2")
                static let activeBorderColor = UIColor(hexString: "035144")
            }

            struct LoginSwitch {
                static let onTintColor = UIColor(hexString: "3BB5A6")
                static let offTintColor = UIColor(hexString: "A5A5A5")
                static let thumbColor = UIColor(hexString: "FFFFFF")
            }

            struct LoginButton {
                static let backGroundColor = UIColor(hexString: "035144")
                static let titleColor = UIColor(hexString: "FFFFFF")
                static let titleFont = UIFont(name: Fonts.montserratRegular, size: 15)
            }

            struct sighnUpEmailButton {
                static let textColor = UIColor(hexString: "#000000")
                static let titleFont = UIFont(name: Fonts.montserratRegular, size: 15)
            }

            struct registerBusinessLabel {
                static let textColor = UIColor(hexString: "#A2A2A2")
                static let titleFont = UIFont(name: Fonts.montserratRegular, size: 15)
            }
        }
        struct SignUpScreen {
            struct TextField{
                static let activeTitleColor = UIColor.clear
                static let passsiveTitleColor = UIColor.clear
                static let tintColor = UIColor.init(hexString: "A2A2A2")
                static let placeHolderColor = UIColor(hexString: "A5A5A5")
                static let textColor = UIColor(hexString: "000000")
                static let passiveBorderColor = UIColor.init(hexString: "A2A2A2")
                static let activeBorderColor = UIColor(hexString: "035144")
            }

            struct SignUpButton {
                static let backGroundColor = UIColor(hexString: "035144")
                static let titleColor = UIColor(hexString: "FFFFFF")
                static let titleFont = UIFont(name: Fonts.montserratRegular, size: 15)
            }

            struct privacyPolicyButton {
                static let textColor = UIColor(hexString: "#000000")
                static let titleFont = UIFont(name: Fonts.montserratRegular, size: 15)
            }
        }
        struct Common{
            static let navigationBarColor = UIColor.init(hexString: "BB9667")
        }
        
        struct Fonts{
            static let montserratRegular = "Montserrat-Regular"
            static let montserratMeedium = "Montserrat-Medium"
            static let montserratSemiBold = "Montserrat-SemiBold"
            static let montserratExtraBold = "Montserrat-ExtraBold"
        }
    }
}
