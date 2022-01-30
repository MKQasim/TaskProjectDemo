//
//  EmailClients.swift
//  TaskProjectDemo
//
//  Created by Apple on 28/01/2022.
//  //  Copyright © 2022 KamsQue. All rights reserved.
//

import Foundation


public struct MailClient {

    /// The name of the mail client.
    public let name: String

    /// The custom URL scheme of the mail client.
    public let URLScheme: String

    /// The URL “root” (after the URL scheme and the colon).
    let URLRoot: String?

    /// The URL query items key for the recipient.
    let URLRecipientKey: String?

    /**
     The URL query items key for the subject, or `nil` if this client doesn’t
     support setting the subject.
     */
    let URLSubjectKey: String?

    /**
     The URL query items key for the message body, or `nil` if this client
     doesn’t support setting the message body.
     */
    let URLBodyKey: String?

    /**
     Returns an array of predefined mail clients.

     - Returns: An array of `ThirdPartyMailClient`.
     */
    public static func clients() -> [MailClient] {
        return [
            // sparrow:[to]?subject=[subject]&body=[body]
            MailClient(name: "Sparrow", URLScheme: "sparrow",
                URLRoot: nil, URLRecipientKey: nil, URLSubjectKey: "subject", URLBodyKey: "body"),
            MailClient(name: "Mail", URLScheme: "message", URLRoot: "//inbox", URLRecipientKey: "to", URLSubjectKey: "subject", URLBodyKey: "body"),
            // googlegmail:///co?to=[to]&subject=[subject]&body=[body]
            MailClient(name: "Gmail", URLScheme: "googlegmail",
                URLRoot: "//inbox", URLRecipientKey: "to", URLSubjectKey: "subject", URLBodyKey: "body"),

            // x-dispatch:///compose?to=[to]&subject=[subject]&body=[body]
            MailClient(name: "Dispatch", URLScheme: "x-dispatch",
                URLRoot: "///compose", URLRecipientKey: "to", URLSubjectKey: "subject", URLBodyKey: "body"),

            // readdle-spark://compose?subject=[subject]&body=[body]&recipient=[recipient]
            MailClient(name: "Spark", URLScheme: "readdle-spark",
                URLRoot: "//compose", URLRecipientKey: "recipient", URLSubjectKey: "subject", URLBodyKey: "body"),

            // airmail://compose?subject=[subject]&from=[from]&to=[to]&cc=[cc]&bcc=[bcc]&plainBody=[plainBody]&htmlBody=[htmlBody]
            MailClient(name: "Airmail", URLScheme: "airmail",
                URLRoot: "//compose", URLRecipientKey: "to", URLSubjectKey: "subject", URLBodyKey: "plainBody"),

            // ms-outlook://compose?subject=[subject]&body=[body]&to=[to]
            MailClient(name: "Microsoft Outlook", URLScheme: "ms-outlook", URLRoot: "//compose", URLRecipientKey: "to", URLSubjectKey: "subject", URLBodyKey: "body"),

            // ymail://mail/compose?subject=[subject]&body=[body]&to=[to]
            MailClient(name: "Yahoo Mail", URLScheme: "ymail", URLRoot: "//mail/compose", URLRecipientKey: "to", URLSubjectKey: "subject", URLBodyKey: "body")]


    }

    /**
     Returns the compose URL for the mail client, based on its custom URL scheme.

     - Parameters recipient: The recipient for the email message (optional).
     - Parameters subject: The subject for the email message (optional).
     - Parameters body: The body for the email message (optional).

     - Returns: A `NSURL` opening the mail client for the given parameters.
     */
    public func composeURL(_ recipient: String?, subject: String?, body: String?) -> URL {
        var components = URLComponents(string: "\(URLScheme):\(URLRoot ?? "")")
        components?.scheme = self.URLScheme

        if URLRecipientKey == nil {
            if let recipient = recipient {
                components = URLComponents(string: "\(URLScheme):\(URLRoot ?? "")\(recipient)")
            }
        }

        var queryItems: [URLQueryItem] = []

        if let recipient = recipient, let URLRecipientKey = URLRecipientKey {
            queryItems.append(URLQueryItem(name: URLRecipientKey, value:recipient))
        }

        if let subject = subject, let URLSubjectKey = URLSubjectKey {
            queryItems.append(URLQueryItem(name: URLSubjectKey, value:subject))
        }

        if let body = body, let URLBodyKey = URLBodyKey {
            queryItems.append(URLQueryItem(name: URLBodyKey, value:body))
        }

        if queryItems.isEmpty == false {
            components?.queryItems = queryItems
        }

        if let URL = components?.url {
            return URL
        }
        else {
            return URLComponents().url!
        }
    }
}

