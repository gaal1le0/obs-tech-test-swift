//
//  MainCoordinator.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import UIKit
import Networking

class MainCoordinator: CoordinatorStuff {
    
    // MARK: - Dependencies
    let factory: MainFactory
    let navigationController: UINavigationController
    let apiClient: APIClient
    
    // MARK: - Inits
    init(_ factory: MainFactory, navigationController: UINavigationController, apiClient: APIClient) {
        self.factory = factory
        self.navigationController = navigationController
        self.apiClient = apiClient
    }
    
    // MARK: - Methods
    func start() {
        let scene = factory.createMainModule(self, apiClient: apiClient)
        navigationController.viewControllers = [scene]
        navigationController.popToRootViewController(animated: true)
    }
    
}

// MARK: - Implementing Navigation Stuff
extension MainCoordinator: MainViewRouter {
    
}
