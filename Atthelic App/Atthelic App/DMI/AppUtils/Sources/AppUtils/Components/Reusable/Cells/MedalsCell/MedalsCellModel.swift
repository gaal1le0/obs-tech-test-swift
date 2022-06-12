//
//  MedalsCellModel.swift
//  
//
//  Created by Emanuel Martinez on 10/6/22.
//

import Foundation

public struct MedalsCellScoreModel {
    let gold: Int
    let silver: Int
    let bronze: Int
    
    public init(gold: Int, silver: Int, bronze: Int) {
        self.gold = gold
        self.silver = silver
        self.bronze = bronze
    }
}

public struct MedalsCellModel {
    
    let title: String
    let score: MedalsCellScoreModel
    
    public init(title: String, score: MedalsCellScoreModel) {
        self.title = title
        self.score = score
    }
    
}
