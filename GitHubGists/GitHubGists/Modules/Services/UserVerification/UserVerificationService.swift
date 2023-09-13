//
//  UserVerificationService.swift
//  GitHubGists
//
//  Created by Pasha Berger on 13.09.2023.
//

import Foundation

protocol UserVerificationServicable {
    func verify(username: String, page: Int) async -> Result<Bool, NetworkingError>
}

final class UserVerificationService: UserVerificationServicable{
    func verify(username: String, page: Int) async -> Result<Bool, NetworkingError> {
        guard let url = API.GitHub.url(path: "users/\(username)/gists", page: page) else {
            return .failure(NetworkingError.parsing(message: Text.Errors.failedToCreateURL))
        }
        
        do {
            let (data, codeResponse) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = codeResponse as? HTTPURLResponse else {
                return .failure(NetworkingError.network(message: Text.Errors.noResponse))
            }
            
            if httpResponse.statusCode == 404 {
                return .failure(NetworkingError.parsing(message: Text.Errors.userDoesntExist))
            } else if limitExceededForIP(with: data) {
                return .failure(NetworkingError.parsing(message: Text.Errors.apiRequestLimit))
            }
            
            let response = try JSONDecoder().decode([GitHubGist].self, from: data)
            
            return response.isEmpty
            ? .failure(NetworkingError.parsing(message: Text.Errors.emptyGists))
            : .success(true)
        }
        catch {
            return .failure(NetworkingError.parsing(message: error.localizedDescription))
        }
    }
    
    private func limitExceededForIP(with data: Data) -> Bool {
        if let errorJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let errorMessage = errorJSON["message"] as? String {
            return true
        }
        return false
    }
}
