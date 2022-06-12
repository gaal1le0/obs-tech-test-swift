//
//  API.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

public enum API {
    
    public enum Athletes {
        
        public static let microservice = "/athletes"
        
        case getAll
        case getById(String)
        case photo(Int)
        case results(String)
        
        public var rawValue: String {
            switch self {
            case .getAll:
                return "\(Self.microservice)"
            case .getById(let athleteId):
                return "\(Self.microservice)/\(athleteId)"
            case .photo(let athleteId):
                return "\(Self.microservice)/\(athleteId)/photo"
            case .results(let athleteId):
                return "\(Self.microservice)/\(athleteId)/results"
            }
        }
        
    }
    
    public enum Games {
        
        public static let microservice = "/games"
        
        case getAll
        case getParticipats(String)

        public var rawValue: String {
            switch self {
            case .getAll:
                return "\(Self.microservice)"
            case .getParticipats(let gameId):
                return "\(Self.microservice)/\(gameId)/athletes"
            }
        }
    }
    
}

