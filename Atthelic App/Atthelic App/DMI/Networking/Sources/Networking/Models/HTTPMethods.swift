//
//  HTTPMethods.swift
//  
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

/// This enum contains all needed information for perform an HTTPRequest
public enum HTTPMethods: String {
    
    case POST = "POST"
    case GET = "GET"
    case PUT = "PUT"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
    
    var isSave: Bool {
        switch self {
            case .GET:
            return false
            case .POST, .PUT, .PATCH, .DELETE:
            return true
        }
    }
    
}
