//
//  UIColor+Extension.swift
//  
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import UIKit

extension UIColor {
    
    static func secureNaming(secureName: String) -> UIColor {
        guard let color = UIColor(named: secureName) else {
            return .red
        }
        return color
    }
    
}
