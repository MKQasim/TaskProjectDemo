//
//  Emialer.swift
//  TaskProjectDemo
//
//  Created by Apple on 28/01/2022.
//  //  Copyright © 2022 KamsQue. All rights reserved.
//

import Foundation
import UIKit

/// Tests third party mail clients availability, and opens third party mail clients in compose mode.
open class MobileMailer {

    /**
     Tests the availability of a third-party mail client.

     - Parameters application: The main application (usually `UIApplication.sharedApplication()`).
     - Parameters client: The third-party client to test.

     - Returns: `true` if the application can open the client; otherwise, `false`.
     */
    open class func application(_ application: UIApplicationOpenURLProtocol, isMailClientAvailable client: MailClient) -> Bool {
        var components = URLComponents()
        components.scheme = client.URLScheme

        guard let URL = components.url
            else { return false }

        return application.canOpenURL(URL)
    }

    /**
     Opens a third-party mail client in compose mode.
     - Parameters application: The main application (usually `UIApplication.sharedApplication()`).
     - Parameters client: The third-party client to test.
     - Parameters recipient: The email address of the recipient (optional).
     - Parameters subject: The email subject (optional).
     - Parameters body: The email body (optional).
     - Returns: `true` if the application opens the client; otherwise, `false`.
     */
    open class func application(_ application: UIApplicationOpenURLProtocol, openMailClient client: MailClient, recipient: String?, subject: String?, body: String?) -> Bool {
            var components = URLComponents()
            components.scheme = client.URLScheme

            guard let URL = components.url
                else { return false }
        return application.openURL(URL)
    }
}

/**
 Extension with URL-specific methods for `UIApplication`, or any other object responsible for handling URLs.
 */
public protocol UIApplicationOpenURLProtocol {
    /**
     Returns a Boolean value indicating whether or not the URL’s scheme can be handled by some app installed on the device.

     - Parameters url: A URL (Universal Resource Locator). At runtime, the system tests the URL’s scheme to determine if there is an installed app that is registered to handle the scheme. More than one app can be registered to handle a scheme.

     - Returns: `NO` if there is no app installed on the device that is registered to handle the URL’s scheme, or if you have not declared the URL’s scheme in your `Info.plist` file; otherwise, `YES`.
     */
    func canOpenURL(_ url: URL) -> Bool

    /**
     Attempts to open the resource at the specified URL.

     - Parameters url: The URL to open.

     - Returns: `YES` if the resource located by the URL was successfully opened; otherwise `NO`.
     */
    func openURL(_ url: URL) -> Bool
}

/// Extend `UIApplication` to conform to the `UIApplicationOpenURLProtocol`.
extension UIApplication: UIApplicationOpenURLProtocol {}
