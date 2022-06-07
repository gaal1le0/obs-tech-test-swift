//
//  RootFactory.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

struct RootFactory {
    
    func createMainModule(_ router: MainViewRouter) -> MainViewController {
        let view = MainViewController()
        let model = MainViewModel(view, router: router)
        view.model = model
        return view
    }
    
}
