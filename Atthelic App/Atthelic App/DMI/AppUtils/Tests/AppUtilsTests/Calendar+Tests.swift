//
//  Calendar+Tests.swift
//
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation
@testable import AppUtils
import XCTest

class CalendarTest: XCTestCase {
    
    func testGetFullYear() {
        let date = "07-01-2001"
        let fmatedDate = DateFormatter.full_date_formatter.date(from: date)
        XCTAssertNotNil(fmatedDate)
        
        let year = Calendar.full_year(fmatedDate)
        XCTAssertNotNil(year)
        XCTAssertEqual(year, 2001)
    }

}
