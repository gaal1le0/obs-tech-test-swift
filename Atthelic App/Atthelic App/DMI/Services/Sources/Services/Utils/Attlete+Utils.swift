//
//  Attlete+Utils.swift
//  
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation
import Networking

public class AttleteGroupedByGameRequest: JSONAPIRequest {
    public typealias APIResponse = [AttheleteDTO]
    public var decoder: JSONDecoder = JSONDecoder()
    public var resourcePath: String
    
    public init(_ gameId: String) {
        self.resourcePath = API.Games.getParticipats(gameId).rawValue
    }
}

public class AttheleteScoreRequest: JSONAPIRequest {
    public typealias APIResponse = [AttheleteScoreDTO]
    public var decoder: JSONDecoder = JSONDecoder()
    public var resourcePath: String
    
    public init(_ attheleteId: String) {
        self.resourcePath = API.Athletes.results(attheleteId).rawValue
    }
}

public class AttleteProfileRequestById: JSONAPIRequest {
    public typealias APIResponse = AttheleteDTO
    public var decoder: JSONDecoder = JSONDecoder()
    public var resourcePath: String
    
    public init(_ attleteId: String) {
        self.resourcePath = API.Athletes.getById(attleteId).rawValue
    }
}
