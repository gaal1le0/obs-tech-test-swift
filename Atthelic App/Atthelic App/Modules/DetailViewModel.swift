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
    private let service: DetailViewDataProvider
    private let attleteId: String
    private let attleteFullName: String
    
    // MARK: - Properties
    private var state: DetailState = .loading {
        didSet {
            self.view?.update(state)
        }
    }
    
    // MARK: - Inits
    init(_ view: DetailViewOutput, service: DetailViewDataProvider, attleteId: String, attleteFullName: String) {
        self.view = view
        self.service = service
        self.attleteId = attleteId
        self.attleteFullName = attleteFullName
    }
    
    deinit {
        print("Deinit DetailViewModel")
    }
    
}

extension DetailViewModel: DetailViewInput {
    func viewWillAppear() {
        view?.configureNavigationBarTitle("\(self.attleteFullName) Details")
    }
    
    func retryLoadingData() {
        
    }
}
