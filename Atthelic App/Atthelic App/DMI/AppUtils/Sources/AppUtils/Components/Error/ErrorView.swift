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
    let container = Atoms.StackViews.Vertical
    let label = UILabel(frame: .zero)
    public let retryButton = UIButton(frame: .zero)
    
    lazy var allSubviews: [UIView] = {
        return [label, retryButton]
    }()
    
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
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        retryButton.backgroundColor = .clear
        retryButton.setTitleColor(.black, for: .normal)
        retryButton.titleLabel?.font = .systemFont(ofSize: 9)
        
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { container.addArrangedSubview($0) }
    
        container.spacing = 8
        fill(container)
        
    }
}
