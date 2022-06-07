//
//  MainViewModel.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

class MainViewModel {
    
    // MARK: - Dependencies
    weak var view: MainViewOutput?
    var router: MainViewRouter
    var service: MainViewDataProvider
    
    // MARK: - Inits
    init(_ view: MainViewOutput, router: MainViewRouter, service: MainViewDataProvider) {
        self.view = view
        self.router = router
        self.service = service
    }
    
    // MARK: - Methods
    
    
}

extension MainViewModel: MainViewInput {
    func viewWillAppear() {
        
    }
}
