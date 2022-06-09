//
//  NSMutableAttributedString+Extension.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    /// - IMPORTANT: If no text is sent, style will be aplied around full text
    public func setColorForText(_ textToFind: String?, with color: UIColor) {
        let range:NSRange?
        if let text = textToFind{
            range = self.mutableString.range(of: text, options: .caseInsensitive)
        }else{
            range = NSMakeRange(0, self.length)
        }
        if range!.location != NSNotFound {
            addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range!)
        }
    }
    
    /// - IMPORTANT: If no text is sent, style will be aplied around full text
    public func setFontFamilyForText(_ textToFind: String?, with font: UIFont) {
        let range:NSRange?
        if let text = textToFind{
            range = self.mutableString.range(of: text, options: .caseInsensitive)
        }else{
            range = NSMakeRange(0, self.length)
        }
        if range!.location != NSNotFound {
            addAttribute(NSAttributedString.Key.font, value: font, range: range!)
        }
    }
    
}
