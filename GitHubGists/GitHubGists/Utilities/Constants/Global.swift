//
//  Global.swift
//  GitHubGists
//
//  Created by Pasha Berger on 11.09.2023.
//

import Foundation
import UIKit

struct Text {
    
    static let search = "Search"
    static let appName = "GitHub\nGists"
    static let username = "Username"
    static let ownerType = "Owner type"
    static let description = "Description"
    static let language = "Language"
    static let filename = "Filename"
    static let placeholder = "No value provided"
    
    struct Titles {
        static let gists = "Gists"
        static let detailedGist = "Gist Details"
    }
    
    struct Alert {
        static let errorOccured = "Error"
        static let ok = "OK"
    }
    
    struct Errors {
        static let invalidUsername = "Invalid Username"
        static let noResponse = "No Response"
        static let userDoesntExist = "User doesn't exist"
        static let emptyGists = "User don't have any public gists"
        static let failedToCreateURL = "Failed to create URL"
    }
}

struct Images {
    static var chevronLeft = UIImage(systemName: "chevron.left")
}

struct ColorPalette {
    static var appWhite = UIColor(named: "appWhite")
    static var appBlack = UIColor(named: "appBlack")
    static var appBackground = UIColor(named: "appBackground")
    static var appLillic = UIColor(named: "appLillic")
    static var appLillicDark = UIColor(named: "appLillicDark")
    static var appCream = UIColor(named: "appCream")
    static var appRed = UIColor(named: "appRed")
}

struct Fonts {
    static func systemBold(of size: CGFloat) -> UIFont? {
        UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func systemRegular(of size: CGFloat) -> UIFont? {
        UIFont.systemFont(ofSize: size, weight: .regular)
    }
}
