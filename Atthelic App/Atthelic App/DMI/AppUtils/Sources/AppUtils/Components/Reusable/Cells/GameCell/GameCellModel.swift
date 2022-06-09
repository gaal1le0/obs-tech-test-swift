//
//  GameCellModel.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation

public struct GameCellModel {
    
    let gameName: String
    let gameYear: String
    let attletes: [ProfileModel]
    let callback: (Int) -> Void
    
    public init(gameName: String, gameYear: String, attletes: [ProfileModel], callback: @escaping (Int) -> Void) {
        self.gameName = gameName
        self.gameYear = gameYear
        self.attletes = attletes
        self.callback = callback
    }
    
}
