//
//  GistsFlowCoordinator.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import Foundation
import UIKit

class GistsFlowCoordinator : BaseCoordinator {

    var navigationController: UINavigationController?
    var username: String
    
    init(navigationController: UINavigationController?, username: String) {
        self.navigationController = navigationController
        self.username = username
    }

    override func start() {

        let viewModel = GistsViewControllerViewModel(username: username, searchingService: GistsSearchingService())
        let viewController = GistsViewController(viewModel: viewModel, contentView: GistsViewControllerContentView())
        
        viewModel.didSelectGist = { [weak self] in
            self?.showDetails($0, in: self?.navigationController)
        }
        
        viewModel.didPressBack = { [weak self] in
            self?.isCompleted?()
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showDetails(_ gist: Gist, in navigationController: UINavigationController?) {
        let coordinator = DetailedGistFlowCoordinator(navigationController: navigationController, gist: gist)
        self.store(coordinator: coordinator)
        
        coordinator.start()
        
    }
}
