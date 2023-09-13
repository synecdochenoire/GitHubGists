//
//  API.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import Foundation

enum API {
    struct GitHub {
        static func url(path: String, page: Int) -> URL? {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "api.github.com"
            components.path = "/\(path)"
            components.queryItems = [
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "per_page", value: "\(6)")
            ]
            
            return components.url
        }
    }
}
