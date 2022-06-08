//
//  MainViewContracts+Utilities.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

struct MainViewStateDataState: Identifiable {
    var id: Int
    
    enum _MainViewStateDataStateInt {
        case loading
        case error(String)
        case data([Atthelete])
    }
    
    let headerTitle: String
    var state: _MainViewStateDataStateInt
    
}

enum MainViewState {
    case loading
    case error(String)
    case data([MainViewStateDataState])
}

protocol MainViewOutput: AnyObject {
    func update(_ state: MainViewState)
}

protocol MainViewInput {
    func viewWillAppear()
    func retryLoadingData()
}

protocol MainViewRouter: AnyObject {
    func showAttleteDetails(_ attleteId: String)
}
