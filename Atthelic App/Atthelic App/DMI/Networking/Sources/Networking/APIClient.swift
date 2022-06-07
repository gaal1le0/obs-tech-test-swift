//
//  APIClient.swift
//  
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

public protocol Cancelable {
    func cancel()
}

public protocol APIClient {
    /// - IMPORTANT: First of all you need to create an APIRequest that conforms with JSONAPIRequest to instantiate an API Request
    /// This methods is used for send a request to the server. You have to take care about it, before your making a server request you must create a server request conforming to JSONAPIRequest and alter all the needed properties to make a right APIRequest
    /// - Parameters:
    ///    - request: T, it conforms to APIRequest and this contains all needed information used to make a right API Request
    ///    - completion: This is the escaping of this function. Result will be send in success case a APIResponse declared as a typealias in another case it will send an error to interact with the user
    /// - Returns:
    ///     - Cancellable:  This return a funcion that conforms to URLSessionDataTask that allow us to contorl the request from the client side.
    @discardableResult
    func send<T: APIRequest>(_ request: T, completion: @escaping (Result<T.APIResponse, Error>) -> Void ) -> Cancelable
}

extension URLSessionDataTask: Cancelable {}

open class AtthelicsAPIClient {
    
    //MARK: - Dependencies
    
    var baseURL: URL
    var urlSession: URLSession
    var clientHeaders: () -> [String: String]
    var dispatchQueue: DispatchQueue
    var logger: NetworkLogger
    
    //MARK: - Inits
    
    public init(_ baseURL: URL, urlSession: URLSession = .shared, dispatchQueue: DispatchQueue = .main, logger: NetworkLogger = APILogger(), clientHeaders: @escaping () -> [String: String] = {[:]}) {
        self.baseURL = baseURL
        self.urlSession = urlSession
        self.dispatchQueue = dispatchQueue
        self.logger = logger
        self.clientHeaders = clientHeaders
    }
    
    // MARK: - Methods
    
    /// This function is mainly focus on is creating the URLRequest
    func urlRequest<T: APIRequest>(for request: T) -> URLRequest {
        var urlRequest = request.generateURLrequest(baseURL)
        clientHeaders().forEach({ (key, value) in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        })
        return urlRequest
    }
    
    func handleResponse<T: APIRequest>(_ request: T, data: Data?, response: URLResponse?, error: Error?) -> Result<T.APIResponse, Error> {
        
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(APIErrors.invalidHTTPRequest)
        }
        
        logger.printLog(environment: .debug, log: logger.log(data: data, response: response, error: error))
        
        if request.accept(httpResponse) {
            return request.parse(httpResponse, data: data)
        } else {
            return .failure(APIErrors.undefinedNetworkError)
        }
        
    }
    
}

//MARK: - Extending ExampleAPIClient to implement's methods
extension AtthelicsAPIClient: APIClient {
    
    @discardableResult
    public func send<T>(_ request: T, completion: @escaping (Result<T.APIResponse, Error>) -> Void) -> Cancelable where T : APIRequest {
        let endpoint = self.urlRequest(for: request)
        logger.printLog(environment: .debug, log: logger.log(request))
        let task = urlSession.dataTask(with: endpoint) {[weak self] (data, response, error) in
            guard let self = self else { return }
            let result = self.handleResponse(request, data: data, response: response, error: error)
            self.dispatchQueue.async {
                completion(result)
            }
        }
        task.resume()
        return task
    }
    
}
