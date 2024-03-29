//
//  MainFactory.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import Networking

struct MainFactory {
    
    func createMainModule(_ router: MainViewRouter, apiClient: APIClient) -> MainViewController {
        let view = MainViewController()
        let service = MainViewDataProvider(apiClient)
        let model = MainViewModel(view, router: router, service: service)
        view.model = model
        return view
    }
    
    func createDetailScene(_ apiClient: APIClient, attleteId: String, attleteFullName: String) -> DetailView {
        let view = DetailView()
        let service = DetailViewDataProvider(apiClient)
        let model = DetailViewModel(view, service: service, attleteId: attleteId, attleteFullName: attleteFullName)
        view.model = model
        return view
    }
    
}
