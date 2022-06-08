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
    public let retryButton = UIButton(frame: .zero)
    
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
        retryButton.setTitle(model.retryButtonText, for: .normal)
    }
    
}

extension ErrorView {
    func setupViews() {
        
        label.textColor = .black.withAlphaComponent(0.5)
        label.font = UIFont(name: "Helvetica", size: 14.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        retryButton.backgroundColor = .clear
        retryButton.tintColor = .black
        retryButton.titleLabel?.font = .systemFont(ofSize: 11)
        
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        addSubview(retryButton)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            retryButton.topAnchor.constraint(equalTo: label.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            retryButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
        ])
        
    }
}
