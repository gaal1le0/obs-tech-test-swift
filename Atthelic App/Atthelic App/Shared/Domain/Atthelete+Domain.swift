//
//  Atthelete+Domain.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

struct Atthelete: Identifiable {
    
    let id: String
    let fullName: String
    let dateOfBirth: Date?
    let biography: String
    let weight: Int
    let height: Int
    let photoId: Int
    
    init(_ dto: AttheleteDTO) {
        self.id = dto.athlete_id
        self.fullName = "\(dto.name) \(dto.surname)"
        self.dateOfBirth = DateFormatter.full_date_formatter.date(from: dto.dateOfBirth)
        self.biography = dto.bio
        self.weight = dto.weight
        self.height = dto.height
        self.photoId = dto.photo_id
    }
    
}

extension Atthelete {
    
    //TODO: Include view dto used for showing into the view
    
}
