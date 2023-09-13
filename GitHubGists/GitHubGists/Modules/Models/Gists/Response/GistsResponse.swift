//
//  GistsResponse.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import Foundation

// MARK: - GistsResponse
struct GistsResponse: Codable {
    var gists: [GitHubGist]
}

import Foundation

struct GitHubGist: Codable {
    let url: String
    let forksUrl: String
    let commitsUrl: String
    let id: String
    let nodeId: String
    let gitPullUrl: String
    let gitPushUrl: String
    let htmlUrl: String
    let description: String?
    let comments: Int
    let files: [String: GistFile]
    let isPublic: Bool
    let commentsUrl: String?
    let owner: GistOwner
    let truncated: Bool

    enum CodingKeys: String, CodingKey {
        case url
        case forksUrl = "forks_url"
        case commitsUrl = "commits_url"
        case id
        case nodeId = "node_id"
        case gitPullUrl = "git_pull_url"
        case gitPushUrl = "git_push_url"
        case htmlUrl = "html_url"
        case description
        case comments
        case files
        case isPublic = "public"
        case commentsUrl = "comments_url"
        case owner
        case truncated
    }
}

struct GistFile: Codable {
    let filename: String
    let type: String
    let language: String?
    let rawUrl: String?
    let size: Int
}

struct GistOwner: Codable {
    let login: String
    let ownerId: Int
    let ownerNodeId: String
    let avatarUrl: String
    let gravatarId: String
    let url: String
    let ownerType: String
    let siteAdmin: Bool

    enum CodingKeys: String, CodingKey {
        case login
        case ownerId = "id"
        case ownerNodeId = "node_id"
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
        case url
        case ownerType = "type"
        case siteAdmin = "site_admin"
    }
}
