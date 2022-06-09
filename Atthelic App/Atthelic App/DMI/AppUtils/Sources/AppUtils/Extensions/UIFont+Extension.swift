//
//  UIFont+Extension.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation
import UIKit

extension Tokens.FontFamily {
    enum Weight: String {
        case light = "Roboto-Thin"
        case regular = "Roboto-Regular"
        case bold = "Roboto-Bold"
        case italic = "Roboto-Italic"
    }
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    
    @objc class func mySystemFont(ofSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        switch weight {
        case .bold, .heavy, .black:
            return UIFont(name: Tokens.FontFamily.Weight.bold.rawValue, size: ofSize)!
            
        case .medium, .regular:
            return UIFont(name: Tokens.FontFamily.Weight.regular.rawValue, size: ofSize)!
            
        default:
            return UIFont(name: Tokens.FontFamily.Weight.light.rawValue, size: ofSize)!
        }
    }
    
    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: Tokens.FontFamily.Weight.light.rawValue, size: size)!
    }
    
    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: Tokens.FontFamily.Weight.bold.rawValue, size: size)!
    }
    
    @objc class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: Tokens.FontFamily.Weight.italic.rawValue, size: size)!
    }
    
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage", "CTFontMediumUsage":
            fontName = Tokens.FontFamily.Weight.regular.rawValue
        case "CTFontEmphasizedUsage", "CTFontBoldUsage", "CTFontSemiboldUsage","CTFontHeavyUsage", "CTFontBlackUsage":
            fontName = Tokens.FontFamily.Weight.bold.rawValue
        case "CTFontObliqueUsage":
            fontName = Tokens.FontFamily.Weight.italic.rawValue
        default:
            fontName = Tokens.FontFamily.Weight.light.rawValue
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    
    public class func overrideDefaultTypography() {
        guard self == UIFont.self else { return }
        
        if let systemFontMethodWithWeight = class_getClassMethod(self, #selector(systemFont(ofSize: weight:))),
            let mySystemFontMethodWithWeight = class_getClassMethod(self, #selector(mySystemFont(ofSize: weight:))) {
            method_exchangeImplementations(systemFontMethodWithWeight, mySystemFontMethodWithWeight)
        }
        
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }
        
        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
            let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }
        
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))),
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}
