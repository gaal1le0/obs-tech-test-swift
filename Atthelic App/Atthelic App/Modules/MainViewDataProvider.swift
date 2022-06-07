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

class MainViewDataProvider {
    
    // MARK: - Dependencies
    var apiClient: APIClient
    
    // MARK: - Inits
    init(_ apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    // MARK: - Methods
    
}
