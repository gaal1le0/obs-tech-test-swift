//
//  RootCordinator.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import UIKit
import Networking

class RootCoordinator: CoordinatorStuff {
    
    // MARK: - Dependencies
    let window: UIWindow
    let navigationController: UINavigationController
    let factory: RootFactory
    let mainCoordinator: MainCoordinator
    let container: RootContainer
    
    // MARK: - Inits
    init(_ window: UIWindow, navigationController: UINavigationController, factory: RootFactory, mainCoordinator: MainCoordinator, container: RootContainer = RootContainer()) {
        self.window = window
        self.navigationController = navigationController
        self.factory = factory
        self.mainCoordinator = mainCoordinator
        self.container = container
    }
    
    // MARK: - Methods
    func start() {
        let scene = factory.createSplashModule(self)
        window.rootViewController = container
        window.makeKeyAndVisible()
        navigationController.viewControllers = [scene]
        container.activate(navigationController)
    }
    
}

// MARK: - Implementing Navigation Stuff
extension RootCoordinator: SplashScreenRouter {
    
    func jumpToMainModule() {
        mainCoordinator.start()
        container.activate(mainCoordinator.navigationController)
    }
    
}
