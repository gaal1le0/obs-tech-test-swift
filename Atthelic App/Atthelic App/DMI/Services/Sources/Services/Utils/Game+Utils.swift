//
//  Game+Utils.swift
//  
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation
import Networking

public class GameListRequest: JSONAPIRequest {
    public typealias APIResponse = [GameDTO]
    public var decoder: JSONDecoder = JSONDecoder()
    
    public var resourcePath: String = API.Games.getAll.rawValue
    
    public init() { }
}
