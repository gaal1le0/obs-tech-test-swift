//
//  APIRequest.swift
//  
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

/// API Request protocol used  for create API Request, all this data stuff will be used to generate all the data staff needed to make request
public protocol APIRequest {
    
    //MARK: - Properties
    associatedtype APIResponse
    var encoder: JSONEncoder { get }
    var resourcePath: String { get }
    var method: HTTPMethods { get }
    
    //MARK: - Methods
    func generateBody() -> Data?
    func generateHeaders() -> [String: String]
    func generateQueryItems() -> [URLQueryItem]
    func generateURLrequest(_ baseURL: URL) -> URLRequest
    
    //MARK: - Used methods
    func accept(_ response: HTTPURLResponse) -> Bool
    func parse(_ response: HTTPURLResponse, data: Data?) -> Result<APIResponse, Error>
    func error(_ response: HTTPURLResponse, data: Data?, error: Error?) -> Result<APIResponse, Error>
    
}

public extension APIRequest {
    
    //MARK: - Properties
    var encoder: JSONEncoder {
        return JSONEncoder()
    }
    
    var method: HTTPMethods {
        return .GET
    }
    
    //MARK: - Methods
    func generateBody() -> Data? {
        return nil
    }
    
    func generateHeaders() -> [String: String] {
        return [:]
    }
    
    func generateQueryItems() -> [URLQueryItem] {
        return []
    }
    
    func accept(_ response: HTTPURLResponse) -> Bool {
        return (200...299).contains(response.statusCode)
    }
    
    func error(_ response: HTTPURLResponse, data: Data?, error: Error?) -> Result<APIResponse, Error> {
        guard let sessionError = error else {
            return .failure(APIErrors.undefinedNetworkError)
        }
        return .failure(sessionError)
    }
    
    func generateURLrequest(_ baseURL: URL) -> URLRequest {
        var request = appendURLParameters(baseURL)
        request.httpMethod = method.rawValue
        request.httpBody = method.isSave ? generateBody() : nil
        request.allHTTPHeaderFields = generateHeaders()
        return request
    }
    
    private func appendURLParameters(_ baseURL: URL) -> URLRequest {
        guard
            let url = URL(string: resourcePath, relativeTo: baseURL),
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        else {
            fatalError("Bad resourceName: \(resourcePath)")
        }
        
        let customQueryItems = generateQueryItems()
        components.queryItems = customQueryItems.isEmpty ? nil : customQueryItems
        guard let finalURL = components.url else { fatalError("Bar URLComponents construction") }
        return URLRequest(url: finalURL)
    }
    
}

/// This protocol is used to generate a JSONAPIRequest
public protocol JSONAPIRequest: APIRequest {
    var decoder: JSONDecoder { get }
}

//MARK: - Extending JSONAPIRequest to implement decodable's methods
extension JSONAPIRequest where APIResponse: Decodable {
    public func parse(_ response: HTTPURLResponse, data: Data?) -> Result<APIResponse, Error> {
        
        // get secure data
        guard let data = data else {
            return .failure(APIErrors.invalidDecodeResponse)
        }
        
        do {
            let decoded = try decoder.decode(APIResponse.self, from: data)
            return .success(decoded)
        }catch{
            print("\n NETWORKING: --- Error decoding data: \(error)")
            return .failure(error)
        }
        
    }
}
