//
//  DetailedGistFlowCoordinator.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import Foundation
import UIKit

class DetailedGistFlowCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController?
    var gist: Gist
    
    init(navigationController: UINavigationController?, gist: Gist) {
        self.navigationController = navigationController
        self.gist = gist
    }
    
    override func start() {
        
        let viewModel = DetailedGistViewControllerViewModel(gist: gist)
        let viewController = DetailedGistViewController(viewModel: viewModel, contentView: DetailedGistViewControllerContentView())
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
