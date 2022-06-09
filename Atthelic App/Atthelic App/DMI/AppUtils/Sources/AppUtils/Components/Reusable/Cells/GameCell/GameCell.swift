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
    public static let Identifier = "GameCell.Identifier.Cell"
    private var data: [ProfileModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var callback: ((Int) -> Void)?
    let container = Atoms.StackViews.Vertical
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(AttleteCell.self, forCellWithReuseIdentifier: AttleteCell.Identifier)
        return cv
    }()
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
        1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AttleteCell.Identifier, for: indexPath) as? AttleteCell else {
            fatalError("Have you registered the cell?")
        }
        cell.bind(data[indexPath.item])
        return cell
    }
}

extension GameCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width/4, height: 124)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Tokens.Edges.Primary
    }
}

extension GameCell: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        callback?(indexPath.row)
    }
}

extension GameCell {
    func setupViews() {
     
        backgroundColor = .white
        rounded()
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isDirectionalLockEnabled = false
        collectionView.isScrollEnabled = true
        
        separator.rounded()
        separator.backgroundColor = Tokens.Colors.Background.Primary
        
        gameYear.tintColor = .black
        gameYear.font = .systemFont(ofSize: 20, weight: .thin)
        gameTitle.tintColor = .black
        gameTitle.font = .systemFont(ofSize: 20, weight: .regular)
        
        headerSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        headerSubviews.forEach { headerContainer.addArrangedSubview($0) }
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { container.addArrangedSubview($0) }
        
        container.spacing = 8
        fill(container, edges: Tokens.Edges.Secondary)
        
        NSLayoutConstraint.activate([
            headerContainer.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 2),
            headerContainer.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -2),
            separator.heightAnchor.constraint(equalToConstant: 4),
            separator.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10),
            separator.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10),
            collectionView.topAnchor.constraint(equalTo: separator.safeAreaLayoutGuide.bottomAnchor),
            collectionView.widthAnchor.constraint(equalTo: container.safeAreaLayoutGuide.widthAnchor),
            collectionView.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
}
