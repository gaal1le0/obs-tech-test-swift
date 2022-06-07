//
//  MainViewModel.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

class MainViewModel {
    
    // MARK: - Dependencies
    weak private var view: MainViewOutput?
    private var router: MainViewRouter
    private var service: MainViewDataProvider
    
    // MARK: - Properties
    private var state: MainViewState = .loading {
        didSet {
            self.view?.update(state)
        }
    }
    
    // MARK: - Inits
    init(_ view: MainViewOutput, router: MainViewRouter, service: MainViewDataProvider) {
        self.view = view
        self.router = router
        self.service = service
    }
    
    deinit {
        print(">>> Deinit MainViewModel")
    }
    
    // MARK: - Methods
    
    
}

extension MainViewModel: MainViewInput {
    func viewWillAppear() {
        
    }
}
