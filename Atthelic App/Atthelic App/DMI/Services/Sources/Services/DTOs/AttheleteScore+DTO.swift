//
//  AttheleteScoreDTO.swift
//  
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation

public struct AttheleteScoreDTO: Decodable {
    public let city: String
    public let year: Int
    public let gold: Int
    public let silver: Int
    public let bronze: Int
}
