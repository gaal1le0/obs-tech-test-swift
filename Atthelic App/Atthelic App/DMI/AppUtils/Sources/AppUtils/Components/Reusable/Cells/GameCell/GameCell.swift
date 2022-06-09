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
    var state: GameCellState = .loading {
        didSet {
            configureView()
        }
    }
    var data: [ProfileModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    let errorView = Molecules.Views.Error
    let loader = Molecules.Spinner
    var tapOnRetry: (() -> Void)?
    var tapOnItem: ((Int) -> Void)?
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
        [headerContainer, separator]
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
        gameTitle.text = model.header.gameName
        gameYear.text = model.header.gameYear
        state = model.state
    }
    
    @objc
    fileprivate func tapOnRetryButtonSelector() {
        tapOnRetry?()
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
        CGSize(width: collectionView.frame.width/4, height: 118)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Tokens.Edges.Primary
    }
}

extension GameCell: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tapOnItem?(indexPath.row)
    }
}

extension GameCell {
    func configureView() {
        switch state {
        case .loading:
            errorView.isHidden = true
            loader.isHidden = false
            loader.start()
            configureLastChildView(loader)
            
        case .error(let errorDTO):
            errorView.isHidden = false
            errorView.bind(.init(errorDTO.message, retryButtonText: "Try again"))
            loader.isHidden = true
            tapOnRetry = errorDTO.tapOnRetry
            configureLastChildView(errorView)
            
        case .data(let stateData):
            tapOnItem = stateData.callback
            data = stateData.attletes
            errorView.isHidden = true
            loader.isHidden = true
            configureLastChildView(collectionView)
            
        }
    }
    
    func configureLastChildView(_ view: UIView) {
        if let lastView = container.arrangedSubviews.last {
            container.removeArrangedSubview(lastView)
            container.addArrangedSubview(view)
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: separator.safeAreaLayoutGuide.bottomAnchor),
                view.widthAnchor.constraint(equalTo: container.safeAreaLayoutGuide.widthAnchor),
                view.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor),
            ])
        } else {
            print(">>> Not child available")
        }
    }
    
    func setupViews() {
     
        backgroundColor = .white
        rounded()
        
        contentView.isUserInteractionEnabled = true
        errorView.retryButton.addTarget(self, action: #selector(tapOnRetryButtonSelector), for: .touchUpInside)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isDirectionalLockEnabled = false
        collectionView.isScrollEnabled = true
        
        separator.rounded(3)
        separator.backgroundColor = Tokens.Colors.Background.Primary
        
        gameYear.tintColor = .black
        gameYear.font = .systemFont(ofSize: 15, weight: .thin)
        gameTitle.tintColor = .black
        gameTitle.font = .systemFont(ofSize: 18, weight: .regular)
        
        headerSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        headerSubviews.forEach { headerContainer.addArrangedSubview($0) }
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { container.addArrangedSubview($0) }
        
        container.spacing = 8
        fill(container, edges: Tokens.Edges.Secondary)
        
        NSLayoutConstraint.activate([
            headerContainer.widthAnchor.constraint(equalTo: container.safeAreaLayoutGuide.widthAnchor),
            separator.heightAnchor.constraint(equalToConstant: 4),
            separator.widthAnchor.constraint(equalTo: headerContainer.widthAnchor)
        ])
        
    }
}
