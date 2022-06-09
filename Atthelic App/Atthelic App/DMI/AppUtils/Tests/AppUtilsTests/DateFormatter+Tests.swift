//
//  DateFormatter+Tests.swift
//  
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation
@testable import AppUtils
import XCTest

class DateFormatterTest: XCTestCase {
    
    func testFullDateFormatter() {
        let date = "07-01-2001"
        let fmatedDate = DateFormatter.full_date_formatter.date(from: date)
        XCTAssertNotNil(fmatedDate)
        
        guard let secureDate = fmatedDate else { return }
        let dateOnString = DateFormatter.full_date_formatter.string(from: secureDate)
        XCTAssertEqual(date, dateOnString)
    }
    
    func testYearDateFormatter() {
        let date = "2001"
        let expectedDate = "01-01-2001"
        let fmatedDate = DateFormatter.year_formatter.date(from: date)
        XCTAssertNotNil(fmatedDate)
        
        guard let secureDate = fmatedDate else { return }
        let dateOnString = DateFormatter.full_date_formatter.string(from: secureDate)
        XCTAssertEqual(expectedDate, dateOnString)
    }
    
}
