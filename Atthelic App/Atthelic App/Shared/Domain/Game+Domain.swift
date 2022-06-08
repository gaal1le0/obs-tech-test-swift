//
//  Game+Domain.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import AppUtils

struct Game {
    
    let id: Int
    let title: String
    let year: Date?
    
    init(_ dto: GameDTO) {
        self.id = dto.game_id
        self.title = dto.city
        self.year = DateFormatter.year_formatter.date(from: String(dto.year))
    }
    
}

extension Game {
    var asHeaderTitleFormatted: String {
        "\(self.title) - \(String(describing: Calendar.full_year(self.year)))"
    }
}

extension Game: Comparable {
    static func < (lhs: Game, rhs: Game) -> Bool {
        guard let lhsDate = lhs.year, let rhsDate = rhs.year else { fatalError("Are you considering timeZone?") }
        return lhsDate.compare(rhsDate) == .orderedDescending
    }
}
