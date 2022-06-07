//
//  RootCordinator.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import UIKit

class RootCoordinator {
    
    // MARK: - Dependencies
    let window: UIWindow
    let navigationController: UINavigationController
    let factory: RootFactory
    
    // MARK: - Inits
    init(_ window: UIWindow, navigationController: UINavigationController, factory: RootFactory) {
        self.window = window
        self.navigationController = navigationController
        self.factory = factory
    }
    
    // MARK: - Methods
    func start() {
        let scene = factory.createMainModule(self)
        navigationController.viewControllers = [scene]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

// MARK: - Implementing Navigation Stuff
extension RootCoordinator: MainViewRouter {
    
}
