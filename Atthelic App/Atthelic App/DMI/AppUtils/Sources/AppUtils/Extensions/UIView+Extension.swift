//
//  UIView+Extension.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation
import UIKit

extension UIView {
    
    public func fill(_ content: UIView = Atoms.Flexible.View, edges: UIEdgeInsets = .zero) {
        content.translatesAutoresizingMaskIntoConstraints = false
        addSubview(content)
        
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: topAnchor, constant: edges.top),
            content.leadingAnchor.constraint(equalTo: leadingAnchor, constant: edges.left),
            content.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -edges.bottom),
            content.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -edges.right)
        ])
    }
    
    public func rounded(_ cornerRadius: CGFloat = Tokens.Radius.Corner) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    public func circular(value: CGFloat = 2) {
        layer.cornerRadius = layer.frame.height / value
        layer.masksToBounds = true
    }
    
}
