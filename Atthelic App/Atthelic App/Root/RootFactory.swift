//
//  RootFactory.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import Networking

struct RootFactory {
    
    func createMainModule(_ router: MainViewRouter, apiClient: APIClient) -> MainViewController {
        let view = MainViewController()
        let service = MainViewDataProvider(apiClient)
        let model = MainViewModel(view, router: router, service: service)
        view.model = model
        return view
    }
    
}
