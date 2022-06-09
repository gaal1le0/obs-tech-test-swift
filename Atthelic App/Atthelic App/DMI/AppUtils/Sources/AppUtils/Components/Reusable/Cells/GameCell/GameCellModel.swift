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

public struct GameCellStateDataModel {
    let attletes: [ProfileModel]
    let callback: (Int) -> Void
    
    public init(attletes: [ProfileModel], callback: @escaping (Int) -> Void) {
        self.attletes = attletes
        self.callback = callback
    }
}

public struct GameCellStateErrorModel {
    let message: String
    let tapOnRetry: () -> Void
    
    public init(message: String, tapOnRetry: @escaping () -> Void) {
        self.message = message
        self.tapOnRetry = tapOnRetry
    }
}

public enum GameCellState {
    case error(GameCellStateErrorModel)
    case data(GameCellStateDataModel)
    case loading
}

public struct GameCellModel {
    
    let header: GameCellHeaderModel
    let state: GameCellState
    
    public init(header: GameCellHeaderModel, state: GameCellState = .loading) {
        self.header = header
        self.state = state
    }
    
}
