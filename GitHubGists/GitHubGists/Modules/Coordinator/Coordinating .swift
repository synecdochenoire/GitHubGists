//
//  Coordinating .swift
//  GitHubGists
//
//  Created by Pasha Berger on 11.09.2023.
//

import Foundation

protocol Coordinator : AnyObject {
    var childCoordinators : [Coordinator] { get set }
    func start()
}

extension Coordinator {

    func store(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func free(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
