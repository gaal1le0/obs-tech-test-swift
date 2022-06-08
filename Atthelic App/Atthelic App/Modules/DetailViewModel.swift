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
    private var attleteId: String
    
    // MARK: - Properties
    private var state: DetailState = .loading {
        didSet {
            self.view?.update(state)
        }
    }
    
    // MARK: - Inits
    init(_ view: DetailViewOutput, service: DetailViewDataProvider, attleteId: String) {
        self.view = view
        self.service = service
        self.attleteId = attleteId
    }
    
    deinit {
        print("Deinit DetailViewModel")
    }
    
}

extension DetailViewModel: DetailViewInput {
    func viewWillAppear() {
        
    }
}
