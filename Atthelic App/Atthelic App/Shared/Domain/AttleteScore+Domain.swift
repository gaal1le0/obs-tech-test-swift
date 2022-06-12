//
//  AttleteScore+Domain.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 12/6/22.
//

import Foundation
import Services

class AttleteScore {
    let gold: Int
    let silver: Int
    let bronze: Int
    
    init(gold: Int, silver: Int, bronze: Int) {
        self.gold = gold
        self.silver = silver
        self.bronze = bronze
    }
    
    convenience init(_ dto: AttheleteScoreDTO) {
        self.init(gold: dto.gold, silver: dto.silver, bronze: dto.bronze)
    }

}
