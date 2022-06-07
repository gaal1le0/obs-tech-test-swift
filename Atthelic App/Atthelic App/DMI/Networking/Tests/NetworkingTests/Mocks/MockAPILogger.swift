//
//  MockAPILogger.swift
//  
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
@testable import Networking

/// Mock for API Logger
class MockAPILogger: NetworkLogger {
    
    func log<T>(_ request: T) -> String where T : APIRequest {
        return "Example LOG with Request"
    }
    
    func log(data: Data?, response: URLResponse?, error: Error?) -> String {
        return "Example log for URLSessionResponse"
    }
    
    func printLog(environment: Environment, log: String) {
        switch environment {
        case .debug:
            print(log)
        case .production:
            print("Data will not be printed due to security reasons")
        }
    }

}
