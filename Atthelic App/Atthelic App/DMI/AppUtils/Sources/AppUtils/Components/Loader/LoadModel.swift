//
//  LoaderModel.swift
//  
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation
import UIKit

public struct LoaderModel {
    
    let color: UIColor
    let format: UIActivityIndicatorView.Style
    
    public init(_ color: UIColor, format: UIActivityIndicatorView.Style = .large) {
        self.color = color
        self.format = format
    }
    
}
