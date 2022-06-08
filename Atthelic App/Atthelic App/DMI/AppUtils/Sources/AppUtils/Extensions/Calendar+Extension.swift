//
//  Calendar+Extension.swift
//  
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation

extension Calendar {
    
    public static func full_year(_ date: Date?) -> Int? {
        let calendar = self.current
        guard let secureDate = date else { return nil }
        let components = calendar.dateComponents([.year], from: secureDate)
        return components.year
    }
    
}
