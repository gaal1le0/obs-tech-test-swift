//
//  MockAPIClient.swift
//  
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
@testable import Networking


//MARK: - First scenario - GET
/// Example GET Mock response
struct MockGETResponse: Codable {
    let name: String
}

/// Mocking example API Client
struct MockExampleGETRequest: JSONAPIRequest {
    
    typealias APIResponse = MockGETResponse
    var resourcePath = "names"
    var decoder: JSONDecoder = JSONDecoder()
    
}

//MARK: - Example APIClient
class MockAPIClient {
    
    //MARK: - Dependencies
    var client: APIClient?
    
    //MARK: - Inits
    init(_ client: APIClient) {
        self.client = client
    }
    
    //MARK: - Methods
    
    // get names using GET methods
    func getNames(callback: @escaping(Result<MockGETResponse, Error>) -> ()){
        let request = MockExampleGETRequest()
        client?.send(request, completion: callback)
    }
    
}
