//
//  Game+Domain.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import AppUtils
import Services

class Game {
    
    let id: Int
    let title: String
    let year: Date?
    var isLoading: Bool
    var attletes: [Atthelete]? {
        didSet {
            if attletes != nil || attletes?.count == 0 {
                isLoading = false
            }
        }
    }
    var yearRaw: Int {
        Calendar.full_year(self.year) ?? 0
    }
    
    init(_ dto: GameDTO, attletes: [Atthelete] = []) {
        self.id = dto.game_id
        self.title = dto.city
        self.year = DateFormatter.year_formatter.date(from: String(dto.year))
        self.attletes = attletes
        self.isLoading = attletes.count > 0 ? false : true
    }
    
}

extension Game: Comparable {
    static func == (lhs: Game, rhs: Game) -> Bool {
        return lhs.yearRaw == rhs.yearRaw
    }
    
    static func < (lhs: Game, rhs: Game) -> Bool {
        guard let lhsDate = lhs.year, let rhsDate = rhs.year else { fatalError("Are you considering timeZone?") }
        return lhsDate.compare(rhsDate) == .orderedDescending
    }
}
