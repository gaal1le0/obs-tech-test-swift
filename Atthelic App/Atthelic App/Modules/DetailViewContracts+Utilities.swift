//
//  DetailViewContracts+Utilities.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

enum DetailState {
    case loading
    case data
    case error(String)
}

protocol DetailViewInput {
    func viewWillAppear()
    func retryLoadingData()
}

protocol DetailViewOutput: AnyObject {
    func update(_ state: DetailState)
    func configureNavigationBarTitle(_ title: String)
}
