//
//  GameCell.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation
import UIKit

public class GameCell: UITableViewCell {
    
    // MARK: - Properties
    static let Identifier = "GameCell.Identifier.Cell"
    
    let container = Atoms.StackViews.Vertical
    let collectionView = UICollectionView(frame: .zero)
    
    let headerContainer = Atoms.StackViews.Horizontal
    let gameTitle = UILabel(frame: .zero)
    let gameYear = UILabel(frame: .zero)
    lazy var headerSubviews: [UIView] = {
        return [gameTitle, gameYear]
    }()
    
    lazy var allSubviews: [UIView] = {
        [headerContainer, collectionView]
    }()
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Models
    public func bind(_ model: GameCellModel) {
        
    }
    
}

extension GameCell {
    func setupViews() {
        
    }
}
