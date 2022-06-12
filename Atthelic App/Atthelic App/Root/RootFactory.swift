//
//  RootFactory.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import Networking

struct RootFactory {
    
    func createSplashModule(_ router: SplashScreenRouter) -> SplashScreenView {
        let view = SplashScreenView()
        let model = SplashScreenModel(router)
        view.model = model
        return view
    }
    
}
