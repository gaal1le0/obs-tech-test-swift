//
//  GameDTO.swift
//  
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation

public struct GameDTO: Decodable {
    public let game_id: Int
    public let city: String
    public let year: Int
}
