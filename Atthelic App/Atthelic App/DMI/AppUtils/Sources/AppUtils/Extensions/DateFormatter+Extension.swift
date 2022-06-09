//
//  DateFormatter+Extension.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

extension DateFormatter {
    
    public static let full_date_formatter: DateFormatter = {
        let fmater = DateFormatter()
        fmater.dateFormat = "MM-dd-yyyy"
        fmater.timeZone = TimeZone.current
        return fmater
    }()
    
    public static let year_formatter: DateFormatter = {
        let fmater = DateFormatter()
        fmater.dateFormat = "yyyy"
        return fmater
    }()
    
}
