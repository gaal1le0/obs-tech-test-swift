//
//  RootCordinator.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import UIKit
import Networking

class RootCoordinator {
    
    // MARK: - Dependencies
    let window: UIWindow
    let navigationController: UINavigationController
    let factory: RootFactory
    let apiClient: APIClient
    
    // MARK: - Inits
    init(_ window: UIWindow, navigationController: UINavigationController, factory: RootFactory, apiClient: APIClient) {
        self.window = window
        self.navigationController = navigationController
        self.factory = factory
        self.apiClient = apiClient
    }
    
    // MARK: - Methods
    func start() {
        let scene = factory.createMainModule(self, apiClient: apiClient)
        navigationController.viewControllers = [scene]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

// MARK: - Implementing Navigation Stuff
extension RootCoordinator: MainViewRouter {
    
}
