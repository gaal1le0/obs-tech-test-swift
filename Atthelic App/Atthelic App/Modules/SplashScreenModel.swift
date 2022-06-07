//
//  SplashScreenModel.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

class SplashScreenModel {
    
    // MARK: - Dependencies
    var router: SplashScreenRouter?
    
    // MARK: - Inits
    init(_ router: SplashScreenRouter) {
        self.router = router
    }
    
}

extension SplashScreenModel: SplashScreenInput {
    func viewWillAppear() {
        //FIXME: On real project handle Authorization and permission checks.
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.router?.jumpToMainModule()
        }
    }
}
