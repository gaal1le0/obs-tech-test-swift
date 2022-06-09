//
//  GameCellModel.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation

public struct GameCellHeaderModel {
    let gameName: String
    let gameYear: String
    
    public init(gameName: String, gameYear: String) {
        self.gameName = gameName
        self.gameYear = gameYear
    }
}

public struct GameCellModel {
    
    let header: GameCellHeaderModel
    let attletes: [ProfileModel]
    let callback: (Int) -> Void
    
    public init(header: GameCellHeaderModel, attletes: [ProfileModel], callback: @escaping (Int) -> Void) {
        self.header = header
        self.attletes = attletes
        self.callback = callback
    }
    
}
