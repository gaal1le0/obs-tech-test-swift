//
//  Tokens.swift
//  
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import UIKit

public enum Tokens {
    
    public enum FontFamily {}
    
    public enum Radius {
        public static let Corner: CGFloat = 8
    }
    
    public enum Edges {
        public static let Primary = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
    public enum Colors {
        
        public enum Background {
            public static let Primary = UIColor.secureNaming(secureName: "Background.Primary")
        }
        
        public enum Grayscale {
            public static let Primary = UIColor.secureNaming(secureName: "Grayscale.Primary")
            public static let Secondary = UIColor.secureNaming(secureName: "Grayscale.Secondary")
            public static let Tertiary = UIColor.secureNaming(secureName: "Grayscale.Tertiary")
            public static let Quaternary = UIColor.secureNaming(secureName: "Grayscale.Quaternary")
        }
        
        public enum Tint {
            public enum Primary {
                public static let Tone1 = UIColor.secureNaming(secureName: "Tint.Primary.Tone1")
                public static let Tone2 = UIColor.secureNaming(secureName: "Tint.Primary.Tone2")
                public static let Tone3 = UIColor.secureNaming(secureName: "Tint.Primary.Tone3")
            }
            
            public enum Secondary {
                public static let Tone1 = UIColor.secureNaming(secureName: "Tint.Secondary.Tone1")
                public static let Tone2 = UIColor.secureNaming(secureName: "Tint.Secondary.Tone2")
                public static let Tone3 = UIColor.secureNaming(secureName: "Tint.Secondary.Tone3")
            }
        }
        
    }
    
}
