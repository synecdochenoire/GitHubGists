//
//  String+Optional.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import Foundation

extension Optional where Wrapped == String {
    var notEmpty: Self {
        self?.isEmpty == true ? nil : self
    }
}
