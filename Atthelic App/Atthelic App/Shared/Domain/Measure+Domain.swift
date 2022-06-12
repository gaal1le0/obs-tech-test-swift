//
//  Measure+Domain.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation

struct Measure {
    let weight: Int
    let height: Int
    
    var fullWeight: String {
        String(weight) + " kg"
    }
    
    var fullHeight: String {
        return String(height) + " cm"
    }
}
