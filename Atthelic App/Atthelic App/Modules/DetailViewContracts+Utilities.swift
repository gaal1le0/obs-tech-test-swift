//
//  DetailViewContracts+Utilities.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import AppUtils

enum DetailStateType {
    case basic(BasicCellModel)
    case medals(MedalsCellModel)
    case text(DescriptionCellModel)
}

struct DetailStateData {
    let fullName: String
    let profilePhotoURL: String
    let domModel: [DetailStateType]
}

enum DetailState {
    case loading
    case data(DetailStateData)
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


