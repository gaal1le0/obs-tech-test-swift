//
//  NetworkTest.swift
//  
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

import XCTest
@testable import Networking

class NetworkTest: XCTestCase {
    
    //MARK: - Dependencies
    let config = URLSessionConfiguration.default
    var urlSession: URLSession!
    var apiLogger: NetworkLogger!
    var sut: AtthelicsAPIClient!
    var clientHeaders: () -> [String: String] = {
        return [:]
    }
    var url: URL!
    var dispachQueue: DispatchQueue!
    
    //MARK: - Inits and tear down methods
    
    // set up all initial values
    override func setUp() {
        url = URL(string: "http://localhost:4000/names")!
        dispachQueue = .global(qos: .default)
        clientHeaders = { [
            "Content-type": "application/json",
            "Accept": "application/json"
        ] }
        apiLogger = APILogger()
        config.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: config)
        sut = AtthelicsAPIClient(url, urlSession: urlSession, dispatchQueue: dispachQueue, logger: apiLogger, clientHeaders: clientHeaders)
    }
    
    // stop all initial values
    override func tearDown() {
        dispachQueue = nil
        apiLogger = nil
        url = nil
        urlSession = nil
        sut = nil
        clientHeaders = {[:]}
    }
    
    //MARK: - All test methods
    
    func testNetworking_ExampleGetRequest_whenRequestGotSuccesfully() {
        
        // create instance of request
        let dataProvider = MockAPIClient(sut)
        
        // match data
        let model = MockGETResponse(name: "Manu")
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: clientHeaders())
        let error: Error? = nil
        let data = try? JSONEncoder().encode(model)
        
        MockURLProtocol.mockURLs = [
          url: (error, data, response)
        ]

        let expectation = self.expectation(description: "Expected to be true due to succesfull network request")
        
        // call to data provider for make a request
        dataProvider.getNames { result in
            
            switch result {
            case .success(let res):
                XCTAssertEqual(res.name, "Manu")
            case .failure(let error):
                XCTFail("This test should be a succesfull response: \(error)")
            }
            
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func testNetworking_ExampleGETRequest_whenRequestGetFailure() {
        
        // mock provider
        let dataProvider = MockAPIClient(sut)
        
        // match data
        let response = HTTPURLResponse(url: url, statusCode: 500, httpVersion: nil, headerFields: clientHeaders())
        let error = APIErrors.undefinedNetworkError
        
        MockURLProtocol.mockURLs = [
          url: (error, nil, response)
        ]
        
        let expectation = self.expectation(description: "This test should failure due to 500 response from server")
        
        dataProvider.getNames { result in
            
            switch result {
            case .success: XCTFail("This test should get a failure result")
            case .failure(let msgError):
                XCTAssertTrue(msgError is APIErrors)
                XCTAssertEqual(msgError as! APIErrors, error)
            }
            
            expectation.fulfill()
            
        }

        self.wait(for: [expectation], timeout: 5)
        
    }
    
}
