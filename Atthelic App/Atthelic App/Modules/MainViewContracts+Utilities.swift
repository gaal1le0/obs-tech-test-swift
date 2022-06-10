//
//  MainViewContracts+Utilities.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import AppUtils

enum MainViewState {
    case loading
    case error(String)
    case data([GameCellModel])
}

protocol MainViewOutput: AnyObject {
    func update(_ state: MainViewState)
}

protocol MainViewInput {
    func viewWillAppear()
    func retryLoadingData()
}

protocol MainViewRouter: AnyObject {
    func showAttleteDetails(_ attleteId: String, attleteFullName: String)
}
