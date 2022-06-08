//
//  ErrorViewModel.swift
//  
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation

public struct ErrorViewModel {
    
    let message: String
    let retryButtonText: String
    
    public init(_ message: String, retryButtonText: String) {
        self.message = message
        self.retryButtonText = retryButtonText
    }
    
}
