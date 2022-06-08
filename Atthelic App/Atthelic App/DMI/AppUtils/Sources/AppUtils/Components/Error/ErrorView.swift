//
//  ErrorView.swift
//  
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation
import UIKit

public class ErrorView: UIView {
    
    // MARK: - Properties
    private let label = UILabel(frame: .zero)
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    public func bind(_ model: ErrorViewModel) {
        label.text = model.message
    }
    
}

extension ErrorView {
    func setupViews() {
        
        label.textColor = .lightGray
        label.font = UIFont(name: "Helvetica", size: 12.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
        ])
        
    }
}
