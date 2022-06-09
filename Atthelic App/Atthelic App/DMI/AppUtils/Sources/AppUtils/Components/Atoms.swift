//
//  Atoms.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation
import UIKit

public enum Atoms {
    
    public enum StackViews {
        public static var Horizontal: UIStackView {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .equalSpacing
            return stackView
        }
        
        public static var Vertical: UIStackView {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .center
            return stackView
        }
    }
    
}
