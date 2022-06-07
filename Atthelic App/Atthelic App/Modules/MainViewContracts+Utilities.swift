//
//  MainViewContracts+Utilities.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

enum MainViewState {
    case loading
    case error(Error)
    case data
}

protocol MainViewOutput: AnyObject {
    func update(_ state: MainViewState)
}

protocol MainViewInput {
    func viewWillAppear()
}

protocol MainViewRouter: AnyObject {
    
}
