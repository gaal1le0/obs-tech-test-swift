//
//  HTTPMethodTest.swift
//  
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

import XCTest
@testable import Networking

class HTTPMethodTest: XCTestCase {
    
    func testIsSaveValue() {
        
        // get data
        let method = HTTPMethods.POST
        
        // ASSERT
        XCTAssertTrue(method.isSave)
        
    }
    
}
