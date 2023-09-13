//
//  BaseCoordinator.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import Foundation

class BaseCoordinator : Coordinator {
    var childCoordinators : [Coordinator] = []
    var isCompleted: (() -> ())?

    func start() {
        fatalError("Children should implement `start`.")
    }
}
