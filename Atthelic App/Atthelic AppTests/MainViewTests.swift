//
//  Atthelic_AppTests.swift
//  Atthelic AppTests
//
//  Created by Emanuel Martinez on 7/6/22.
//

import XCTest
import Networking
@testable import Atthelic_App

fileprivate class MainViewMock: MainViewOutput {
    var isCalledUpdate = false
    func update(_ state: MainViewState) {isCalledUpdate = true}
}

fileprivate class MainViewRouterMock: MainViewRouter {
    var jumpedToDetailView = false
    func showAttleteDetails(_ attleteId: String, attleteFullName: String) { jumpedToDetailView = true }
}

class Atthelic_AppTests: XCTestCase {
    
    // MARK: - Properties
    fileprivate var sut: MainViewModel?
    fileprivate var view: MainViewMock?
    fileprivate var router: MainViewRouterMock?
    fileprivate var apiClient: APIClient?
    
    // MARK: - Lifecycle
    override func setUp() {
        view = MainViewMock()
        router = MainViewRouterMock()
        apiClient = AtthelicsAPIClient(URL(string: "https://example.com")!)
        sut = .init(view!, router: router!, service: .init(apiClient!))
    }
    
    override func tearDown() {
        view = nil
        router = nil
        sut = nil
        apiClient = nil
    }
    
    // MARK: - Test cases
    func testJumpedToDetail() {
        self.sut?.router.showAttleteDetails("Example-ID", attleteFullName: "ExampleName")
        XCTAssertTrue(router!.jumpedToDetailView)
    }
    
}
