//
//  SplashScreenContracts+Utilities.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

protocol SplashScreenInput {
    func viewWillAppear()
}

protocol SplashScreenRouter: AnyObject {
    func jumpToMainModule()
}
