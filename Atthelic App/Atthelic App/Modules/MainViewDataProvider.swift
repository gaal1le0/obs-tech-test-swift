//
//  MainViewDataProvider.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import Networking
import Services

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
