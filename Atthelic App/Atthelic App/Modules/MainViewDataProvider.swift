//
//  MainViewDataProvider.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import Networking

struct AttheleteDTO: Decodable {
    let athlete_id: String
    let name: String
    let surname: String
    let dateOfBirth: String
    let bio: String
    let weight: Int
    let height: Int
    let photo_id: Int    
}

struct GameDTO: Decodable {
    let game_id: Int
    let city: String
    let year: Int
}

struct AttheleteScoreDTO: Decodable {
    let city: String
    let year: Int
    let gold: Int
    let silver: Int
    let bronze: Int
}

class GameListRequest: JSONAPIRequest {
    typealias APIResponse = [GameDTO]
    var decoder: JSONDecoder = JSONDecoder()
    
    var resourcePath: String = API.Games.getAll.rawValue
}

class AttleteGroupedByGameRequest: JSONAPIRequest {
    typealias APIResponse = [AttheleteDTO]
    var decoder: JSONDecoder = JSONDecoder()
    var resourcePath: String
    
    init(_ gameId: String) {
        self.resourcePath = API.Games.getParticipats(gameId).rawValue
    }
}

class AttheleteScoreRequest: JSONAPIRequest {
    typealias APIResponse = [AttheleteScoreDTO]
    var decoder: JSONDecoder = JSONDecoder()
    var resourcePath: String
    
    init(_ attheleteId: String) {
        self.resourcePath = API.Athletes.results(attheleteId).rawValue
    }
}

class MainViewDataProvider {
    
    // MARK: - Dependencies
    var apiClient: APIClient
    
    // MARK: - Inits
    init(_ apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    // MARK: - Methods
    func getGameDTO(completion: @escaping (Result<[GameDTO], Error>) -> Void) {
        let request = GameListRequest()
        apiClient.send(request, completion: completion)
    }
        
    func getAttletes(gameId: String, completion: @escaping (Result<[AttheleteDTO], Error>) -> Void) {
        let request = AttleteGroupedByGameRequest(gameId)
        apiClient.send(request, completion: completion)
    }
    
    func getAttleteScore(attleteId: String, completion: @escaping (Result<[AttheleteScoreDTO], Error>) -> Void) {
        let request = AttheleteScoreRequest(String(attleteId))
        apiClient.send(request, completion: completion)
    }

}
