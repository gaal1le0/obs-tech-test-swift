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
    private var data: [ProfileModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let container = Atoms.StackViews.Vertical
    let collectionView = UICollectionView(frame: .zero)
    let separator = UIView(frame: .zero)
    let headerContainer = Atoms.StackViews.Horizontal
    let gameTitle = UILabel(frame: .zero)
    let gameYear = UILabel(frame: .zero)
    lazy var headerSubviews: [UIView] = {
        return [gameTitle, gameYear]
    }()
    
    lazy var allSubviews: [UIView] = {
        [headerContainer, separator, collectionView]
    }()
    
    // MARK: - Inits
    init() {
        super.init(style: .default, reuseIdentifier: GameCell.Identifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Models
    public func bind(_ model: GameCellModel) {
        gameTitle.text = model.gameName
        gameYear.text = model.gameYear
        data = model.attletes
    }
    
}

extension GameCell: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = AttleteCell()
        cell.bind(data[indexPath.item])
        return cell
    }
}

extension GameCell {
    func setupViews() {
     
        collectionView.register(AttleteCell.self, forCellWithReuseIdentifier: AttleteCell.Identifier)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        separator.rounded()
        separator.backgroundColor = Tokens.Colors.Background.Primary
        separator.heightAnchor.constraint(equalToConstant: 4).isActive = true
            
        gameYear.tintColor = .black
        gameYear.font = .systemFont(ofSize: 20, weight: .thin)
        
        gameTitle.tintColor = .black
        gameTitle.font = .systemFont(ofSize: 20, weight: .regular)
        
        headerSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        headerSubviews.forEach { headerContainer.addArrangedSubview($0) }
        
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { container.addArrangedSubview($0) }
        
        container.spacing = 8
        fill(container)
        
    }
}
