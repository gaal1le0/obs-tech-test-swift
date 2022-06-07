//
//  DetailViewModel.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

class DetailViewModel {
    
    // MARK: - Depedencies
    weak private var view: DetailViewOutput?
    private var service: DetailViewDataProvider
    
    // MARK: - Properties
    private var state: DetailState = .loading {
        didSet {
            self.view?.update(state)
        }
    }
    
    // MARK: - Inits
    init(_ view: DetailViewOutput, service: DetailViewDataProvider) {
        self.view = view
        self.service = service
    }
    
    deinit {
        print("Deinit DetailViewModel")
    }
    
}

extension DetailViewModel: DetailViewInput {
    func viewWillAppear() {
        
    }
}
