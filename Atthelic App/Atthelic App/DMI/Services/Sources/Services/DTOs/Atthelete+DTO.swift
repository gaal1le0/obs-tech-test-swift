//
//  AttheleteDTO.swift
//  
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation

public struct AttheleteDTO: Decodable {
    public let athlete_id: String
    public let name: String
    public let surname: String
    public let dateOfBirth: String
    public let bio: String
    public let weight: Int
    public let height: Int
    public let photo_id: Int
}
