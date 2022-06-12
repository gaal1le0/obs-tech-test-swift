//
//  DescriptionCell.swift
//  
//
//  Created by Emanuel Martinez on 11/6/22.
//

import Foundation
import UIKit
import CDMarkdownKit

public class DescriptionCell: UITableViewCell {

    // MARK: - Properties
    public static let Identifier = "DescriptionCell.Identifier"
    let container = Atoms.StackViews.Vertical
    let titleLabel = UILabel(frame: .zero)
    let biographyText = UILabel(frame: .zero)
    let markdownParser = CDMarkdownParser()
    
    lazy var allSubviews: [UIView] = {
        return [titleLabel, biographyText]
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
    public func bind(_ model: DescriptionCellModel) {
        biographyText.attributedText = markdownParser.parse(model.biography)
        
    }
    
}

extension DescriptionCell {
    func setupViews() {
        
        contentView.isUserInteractionEnabled = true
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textAlignment = .left
        titleLabel.text = "Biography"
        
        biographyText.textAlignment = .left
        biographyText.tintColor = .black
        biographyText.font = .systemFont(ofSize: 14, weight: .regular)
        biographyText.numberOfLines = 0
        
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { container.addArrangedSubview($0) }
        container.spacing = 8
        container.alignment = .leading
        
        fill(container, edges: Tokens.Edges.Secondary)
        
    }
}
