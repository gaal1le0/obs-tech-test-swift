//
//  MedalCounter.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation
import UIKit

public class MedalCounter: UIView {
    
    // MARK: - Properties
    let circle = Atoms.StackViews.Vertical
    let counter = UILabel(frame: .zero)
    
    lazy var allSubviews: [UIView] = {
        return [counter]
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
    public func bind(_ model: MedalCounterModel) {
        counter.text = model.counter
        setupAppearence(model.type)
    }
    
}

extension MedalCounter {
    
    func setupViews() {
        
        counter.textAlignment = .center
        counter.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        counter.tintColor = .black
        
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { circle.addArrangedSubview($0) }
        
        circular()
        circle.circular()
        
        circle.layer.borderWidth = 1        
        fill(circle, edges: Tokens.Edges.Primary)
        
        NSLayoutConstraint.activate([
            circle.widthAnchor.constraint(equalToConstant: 28),
            circle.heightAnchor.constraint(equalToConstant: 28),
        ])
        
    }
    
    func setupAppearence(_ type: ModelCounterType) {
        switch type {
        case .Gold:
            circle.layer.borderColor = Tokens.Colors.Tint.Secondary.Tone1.cgColor
            backgroundColor = Tokens.Colors.Tint.Primary.Tone1
        case .Silver:
            backgroundColor = Tokens.Colors.Tint.Primary.Tone2
            circle.layer.borderColor = Tokens.Colors.Tint.Secondary.Tone2.cgColor
        case .Bronze:
            backgroundColor = Tokens.Colors.Tint.Primary.Tone3
            circle.layer.borderColor = Tokens.Colors.Tint.Secondary.Tone3.cgColor
        }
    }
    
}
