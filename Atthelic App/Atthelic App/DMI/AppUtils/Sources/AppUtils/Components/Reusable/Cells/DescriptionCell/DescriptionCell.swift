//
//  DescriptionCell.swift
//  
//
//  Created by Emanuel Martinez on 11/6/22.
//

import Foundation
import UIKit

public class DescriptionCell: UITableViewCell {

    // MARK: - Properties
    public static let Identifier = "DescriptionCell.Identifier"
    let container = Atoms.StackViews.Vertical
    let titleLabel = UILabel(frame: .zero)
    let biographyText = UITextView(frame: .zero)
    let onReadMore = UIButton(frame: .zero)
    
    lazy var allSubviews: [UIView] = {
        return [titleLabel, biographyText, onReadMore]
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
        biographyText.text = model.biography
    }
    
    @objc
    func openMoreText() {
        print("Hey mostrar mas texto")
    }
    
}

extension DescriptionCell {
    func setupViews() {
        
        contentView.isUserInteractionEnabled = true
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        titleLabel.textAlignment = .left
        titleLabel.text = "Biography"
        
        onReadMore.setTitle("Read more ->", for: .normal)
        onReadMore.setTitleColor(.black, for: .normal)
        onReadMore.backgroundColor = .clear
        onReadMore.layer.borderColor = UIColor.clear.cgColor
        onReadMore.titleLabel?.font = .systemFont(ofSize: 14, weight: .thin)
        onReadMore.titleLabel?.textAlignment = .left
        onReadMore.addTarget(self, action: #selector(openMoreText), for: .touchUpInside)
        
        biographyText.isEditable = false
        biographyText.isSelectable = false
        biographyText.backgroundColor = .clear
        biographyText.textAlignment = .left
        biographyText.tintColor = .black
        biographyText.font = .systemFont(ofSize: 14, weight: .regular)
        
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { container.addArrangedSubview($0) }
        container.spacing = 4
        container.alignment = .leading
        
        fill(container, edges: Tokens.Edges.Secondary)
        
    }
}
