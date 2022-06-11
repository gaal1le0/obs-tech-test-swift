//
//  Atthelete+Domain.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import AppUtils
import Services

class Atthelete: Identifiable {
    
    let id: String
    let fullName: String
    let dateOfBirth: Date?
    let biography: String
    let measure: Measure
    let photoURI: String
    let score: AttleteScore?
    
    var dateOfBirthFormatted: String {
        if let d =  Calendar.full_year(self.dateOfBirth) {
            return String(d)
        }
        return "Not available"
    }
    var scoreAmmount: Int {
        if let score = score {
            return ((score.gold * 5) + (score.silver * 3) + (score.bronze * 1))
        } else {
            return 0
        }
    }
    var photoURL: URL? {
        return URL(string: photoURI)
    }
    
    init(_ dto: AttheleteDTO, score: AttleteScore?) {
        self.id = dto.athlete_id
        self.fullName = "\(dto.name) \(dto.surname)"
        self.dateOfBirth = DateFormatter.full_date_formatter.date(from: dto.dateOfBirth)
        self.biography = dto.bio
        self.measure = .init(weight: dto.weight, height: dto.height)
        self.photoURI = Constants.kAPI.kBaseURL+API.Athletes.photo(dto.photo_id).rawValue
        self.score = score
    }
    
    convenience init(_ dto: AttheleteDTO, scores: [AttleteScore]) {
        self.init(dto, score: AttleteScore(gold: scores.reduce(0) { partialResult, item in
            partialResult + item.gold
        }, silver: scores.reduce(0) { partialResult, item in
            partialResult + item.silver
        }, bronze: scores.reduce(0) { partialResult, item in
            partialResult + item.bronze
        }))
    }
    
}

extension Atthelete: Equatable {
    static func == (lhs: Atthelete, rhs: Atthelete) -> Bool {
        lhs.scoreAmmount == rhs.scoreAmmount
    }
}

extension Atthelete: Comparable {
    static func < (lhs: Atthelete, rhs: Atthelete) -> Bool {
        lhs.scoreAmmount < rhs.scoreAmmount
    }
}
