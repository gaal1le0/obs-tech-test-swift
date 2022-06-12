//
//  PhotoCell.swift
//  
//
//  Created by Emanuel Martinez on 12/6/22.
//

import Foundation
import UIKit

public class PhotoCell: UITableViewCell {
    
    // MARK: - Properties
    public static let Identifier = "PhotoCell.Identifier"
    
    let container = Atoms.StackViews.Vertical
    let profilePhoto = UIImageView(frame: .zero)
    let loader = Molecules.Spinner
    
    lazy var allSubviews: [UIView] = {
        return [loader, profilePhoto]
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
    public func bind(_ model: PhotoCellModel) {
        self.profilePhoto.downloadedFrom(url: model.photoURL) {
            self.loader.isHidden = true
            self.profilePhoto.isHidden = false
        }
    }
    
}

extension PhotoCell {
    func setupViews() {
        
        profilePhoto.contentMode = .scaleAspectFill
        loader.bind(.init(.black, format: .medium))
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.start()
        
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { container.addArrangedSubview($0) }
        
        container.fill(profilePhoto)
        fill(container, edges: Tokens.Edges.Primary)
        
        NSLayoutConstraint.activate([
            profilePhoto.heightAnchor.constraint(equalToConstant: 190)
        ])
    }
}
