//
//  Atthelete+Domain.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import AppUtils

struct Atthelete: Identifiable {
    
    let id: String
    let fullName: String
    let dateOfBirth: Date?
    let biography: String
    let weight: Int
    let height: Int
    let photoURI: String
    let score: Int
    
    init(_ dto: AttheleteDTO, score: AttheleteScoreDTO) {
        self.id = dto.athlete_id
        self.fullName = "\(dto.name) \(dto.surname)"
        self.dateOfBirth = DateFormatter.full_date_formatter.date(from: dto.dateOfBirth)
        self.biography = dto.bio
        self.weight = dto.weight
        self.height = dto.height
        self.photoURI = API.Athletes.photo(dto.photo_id).rawValue
        self.score = ((score.gold * 5) + (score.silver * 3) + (score.bronze * 1))
    }
    
}

extension Atthelete: Comparable {
    static func < (lhs: Atthelete, rhs: Atthelete) -> Bool {
        lhs.score < rhs.score
    }
}
