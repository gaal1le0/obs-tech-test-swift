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

    let profilePhoto = UIImageView(frame: .zero)
    let loader = Molecules.Spinner
    
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
        
        profilePhoto.translatesAutoresizingMaskIntoConstraints = false
        fill(profilePhoto, edges: Tokens.Edges.Primary)
        fill(loader)
        
        NSLayoutConstraint.activate([
            profilePhoto.heightAnchor.constraint(equalToConstant: 190)
        ])
    }
}
