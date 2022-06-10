//
//  MedalsCell.swift
//  
//
//  Created by Emanuel Martinez on 10/6/22.
//

import Foundation
import UIKit

public class MedalsCell: UITableViewCell {
    
    // MARK: - Properties
    public static let Identifier = "MedalsCell.Identifier"
    let container = Atoms.StackViews.Horizontal
    let medalsContainer = Atoms.StackViews.Horizontal
    let titleLabel = UILabel(frame: .zero)
    let errorTitle = UILabel(frame: .zero)
    
    lazy var allSubviews: [UIView] = {
        return [titleLabel, medalsContainer]
    }()
    
    // MARK: - Inits
    init() {
        super.init(style: .default, reuseIdentifier: MedalsCell.Identifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    public func bind(_ model: MedalsCellModel) {
        titleLabel.text = model.title
        if model.score.gold != 0 || model.score.bronze != 0 || model.score.silver != 0 {
            medalController(total: model.score.gold, type: .Gold)
            medalController(total: model.score.silver, type: .Silver)
            medalController(total: model.score.bronze, type: .Bronze)
        }else{
            container.removeArrangedSubview(medalsContainer)
            container.addArrangedSubview(errorTitle)
        }
    }
    
    func medalController(total: Int, type: ModelCounterType) {
        if total > 0 {
            let medal = MedalCounter()
            medal.bind(.init(counter: String(total), type: type))
            medalsContainer.addArrangedSubview(medal)
        }
    }
    
}

extension MedalsCell {
    func setupViews() {
        
        isUserInteractionEnabled = false
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        titleLabel.textAlignment = .left
        errorTitle.text = "Let's cry :("
        errorTitle.font = .systemFont(ofSize: 14, weight: .thin)
        errorTitle.textAlignment = .right
        
        medalsContainer.alignment = .trailing
        medalsContainer.spacing = 8
        
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { container.addArrangedSubview($0) }
        
        fill(container, edges: Tokens.Edges.Secondary)
    }
}
