//
//  Atthelete+Domain.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import AppUtils
import Services

struct Atthelete: Identifiable {
    
    let id: String
    let fullName: String
    let dateOfBirth: Date?
    let biography: String
    let measure: Measure
    let photoURI: String
    let score: Int
    
    var photoURL: URL? {
        return URL(string: photoURI)
    }
    
    init(_ dto: AttheleteDTO, score: AttheleteScoreDTO?) {
        self.id = dto.athlete_id
        self.fullName = "\(dto.name) \(dto.surname)"
        self.dateOfBirth = DateFormatter.full_date_formatter.date(from: dto.dateOfBirth)
        self.biography = dto.bio
        self.measure = .init(weight: dto.weight, height: dto.height)
        self.photoURI = Constants.kAPI.kBaseURL+API.Athletes.photo(dto.photo_id).rawValue
        if let score = score {
            self.score = ((score.gold * 5) + (score.silver * 3) + (score.bronze * 1))
        } else {
            self.score = 0
        }
    }
    
}

extension Atthelete: Equatable {
    static func == (lhs: Atthelete, rhs: Atthelete) -> Bool {
        lhs.score == rhs.score
    }
}

extension Atthelete: Comparable {
    static func < (lhs: Atthelete, rhs: Atthelete) -> Bool {
        lhs.score < rhs.score
    }
}
