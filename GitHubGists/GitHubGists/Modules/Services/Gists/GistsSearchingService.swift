//
//  GistsSearchingService.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import Foundation


protocol GistsSearchingServicable {
    func searchForGists(with username: String, page: Int) async -> Result<[GitHubGist], NetworkingError>
}

final class GistsSearchingService: GistsSearchingServicable {
    func searchForGists(with username: String, page: Int) async -> Result<[GitHubGist], NetworkingError> {
        guard let url = API.GitHub.url(path: "users/\(username)/gists", page: page) else {
            return .failure(NetworkingError.parsing(message: Text.Errors.failedToCreateURL))
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode([GitHubGist].self, from: data)
    
            return .success(response)
        }
        catch {
            return .failure(NetworkingError.parsing(message: error.localizedDescription))
        }
    }
}
