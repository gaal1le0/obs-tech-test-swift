//
//  MockURLProtocol.swift
//  
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

/// This class allow us to mock up the response
class MockURLProtocol: URLProtocol {
    
    /// Dictionary maps URLs to tuples of error, data, and response
    static var mockURLs = [URL?: (error: Error?, data: Data?, response: HTTPURLResponse?)]()
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        // Required to be implemented here. Just return what is passed
        return request
    }
    
    override func startLoading() {
        if let url = request.url {
            if let value = MockURLProtocol.mockURLs[url] {
                print(String(describing: value.response))
                if let responseStrong = value.response {
                    self.client?.urlProtocol(self, didReceive: responseStrong, cacheStoragePolicy: .notAllowed)
                }
                
                if let dataStrong = value.data {
                    self.client?.urlProtocol(self, didLoad: dataStrong)
                }
            
                if let errorStrong = value.error {
                    self.client?.urlProtocol(self, didFailWithError: errorStrong)
                }
            }
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
    
}
