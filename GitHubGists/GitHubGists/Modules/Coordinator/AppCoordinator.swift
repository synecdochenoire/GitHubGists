//
//  AppCoordinator.swift
//  GitHubGists
//
//  Created by Pasha Berger on 11.09.2023.
//

import Foundation
import UIKit

final class AppCoordinator: BaseCoordinator {
    
    //MARK: - Properties
    var navigationController: UINavigationController
    
    private var window: UIWindow
    
    private var rootView: Viewing {
        navigationController
    }
    
    init(windowScene: UIWindowScene, navigationController: UINavigationController) {
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window.windowScene = windowScene
        self.navigationController = navigationController
    }
    
    private func bootApp() {
        let searchFlowCoordinator = SearchFlowCoordinator(navigationController: navigationController)
        self.store(coordinator: searchFlowCoordinator)
        
        searchFlowCoordinator.start()
        
        searchFlowCoordinator.isCompleted = { [weak self] in
            self?.free(coordinator: searchFlowCoordinator)
        }
    }
    
    override func start() {
        window.rootViewController = rootView.asViewController
        window.makeKeyAndVisible()
        
        bootApp()
    }
}
