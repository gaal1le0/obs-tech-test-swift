//
//  Atthelic_AppUITestsLaunchTests.swift
//  Atthelic AppUITests
//
//  Created by Emanuel Martinez on 7/6/22.
//

import XCTest

class Atthelic_AppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        XCTAssertTrue(true)
    }
}
