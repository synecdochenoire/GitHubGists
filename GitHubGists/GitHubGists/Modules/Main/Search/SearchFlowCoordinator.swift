//
//  SearchFlowCoordinator.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import Foundation
import UIKit

class SearchFlowCoordinator : BaseCoordinator {
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        
        let viewModel = SearchViewControllerViewModel(verificationService: UserVerificationService())
        let viewController = SearchViewController(viewModel: viewModel, contentView: SearchViewControllerContentView())
        
        viewModel.usernamePassedValidation = { [weak self] username in
            guard let strongSelf = self else { return }
            strongSelf.showGists(for: username, in: strongSelf.navigationController)
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showGists(for username: String, in navigationController: UINavigationController?) {
        let coordinator = GistsFlowCoordinator(navigationController: navigationController, username: username)
        self.store(coordinator: coordinator)
        
        coordinator.isCompleted = { [weak self] in
            self?.free(coordinator: coordinator)
        }
        
        coordinator.start()
    }
}
