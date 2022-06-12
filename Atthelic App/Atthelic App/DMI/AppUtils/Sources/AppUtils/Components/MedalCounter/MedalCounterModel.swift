//
//  MedalCounterModel.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation

public struct MedalCounterModel {
    let counter: String
    let type: ModelCounterType
    
    public init(counter: String, type: ModelCounterType) {
        self.counter = counter
        self.type = type
    }
}
