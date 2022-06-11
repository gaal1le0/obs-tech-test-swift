//
//  BasicCell.swift
//  
//
//  Created by Emanuel Martinez on 10/6/22.
//

import Foundation
import UIKit

public class BasicCell: UITableViewCell {
    
    // MARK: - Properties
    public static let Identifier = "BasicCell.Identifier"
    let container = Atoms.StackViews.Horizontal
    let titleLabel = UILabel(frame: .zero)
    let subtitleLabel = UILabel(frame: .zero)
    
    lazy var allSubviews: [UIView] = {
        return [titleLabel, subtitleLabel]
    }()
    
    // MARK: - Inits
    init() {
        super.init(style: .default, reuseIdentifier: Self.Identifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    public func bind(_ model: BasicCellModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
    
}

extension BasicCell {
    func setupViews() {
        
        isUserInteractionEnabled = false
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        titleLabel.textAlignment = .left
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        subtitleLabel.textAlignment = .right
        
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { container.addArrangedSubview($0) }
        
        fill(container, edges: Tokens.Edges.Secondary)
    }
}
