//
//  APILogger.swift
//  
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

/// This protocol allows us to create loggers from this Networking layer
public protocol NetworkLogger {
    /// This method is focus on print all the data staff related to request
    func log<T: APIRequest>(_ request: T) -> String
    /// This method is focus on print all the data staff related to the response of each data task
    func log(data: Data?, response: URLResponse?, error: Error?) -> String
    /// This method allow us to print the log using an environment
    func printLog(environment: Environment, log: String)
}

/// This case is used for hide sensible information in production
public enum Environment {
    case debug
    case production
}

public class APILogger: NetworkLogger {
    
    public init(){}
    
    public func printLog(environment: Environment, log: String) {
        switch environment {
        case .debug:
            print(log)
        case .production:
            print("Log cannot be printed it's in production state")
        }
    }
    
    public func log<T>(_ request: T) -> String where T : APIRequest {
        var log = "\n ---- OUR REQUEST ----- \n"
        log += "\n* METHOD: \(request.method.rawValue) \n"
        log += "* RESOURCE PATH: \(request.resourcePath) \n"
        log += "\n ---------------------- \n"
        return log
    }
    
    public func log(data: Data?, response: URLResponse?, error: Error?) -> String {
        var log = "\n --- RESPONSE RECEIVED ---- \n"
        log += "\n * ERROR \(error?.localizedDescription ?? "No error presented")"
        if let response = response as? HTTPURLResponse {
            log += "\n * RESPONSE \(response.statusCode) response code"
            log += "\n * MIME-TYPE: \(response.mimeType ?? "No MIME presented")"
            log += "\n * URL \(String(describing: response.url!.absoluteString))"
            log += "\n * HEADERS: \(response.allHeaderFields.count == 0 ? "NO HEADERS" : "")"
            response.allHeaderFields.forEach { log += "\n    - KEY: \($0.key) VALUE: \($0.value)" }
        }
        if let data = data {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                log += "\n * RESPONSE BODY: \(json) \n"
            } catch {
                log += "\n * RESPONSE BODY: Decoding error:"
                log += "\n    - INFO: \(error.localizedDescription)"
            }
        }else{
            log += "\n * RESPONSE BODY: There is no body in response"
        }
        log += "\n ---------------------------- \n"
        return log
    }
    
}
