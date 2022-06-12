//
//  Profile.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation
import UIKit

public class Profile: UIView {
    
    // MARK: - Properties
    let container = Atoms.StackViews.Vertical
    let profileName = UILabel(frame: .zero)
    let profileImage = UIImageView(frame: .zero)
    let loader = Molecules.Spinner
    
    lazy var allSubviews: [UIView] = {
        return [profileImage, loader, profileName]
    }()
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    public func bind(_ model: ProfileModel) {
        profileImage.downloadedFrom(url: model.profileImageURL) {
            self.loader.stop()
            self.profileImage.isHidden = false
            self.profileImage.circular()
        }
        profileName.text = model.fullName
    }
    
}

extension Profile {
    func setupViews() {
        
        loader.start()
        
        profileImage.contentMode = .scaleAspectFill
        profileImage.isHidden = true
        profileName.numberOfLines = 2
        profileName.textAlignment = .center
        profileName.font = .systemFont(ofSize: 14, weight: .semibold)
        
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { container.addArrangedSubview($0) }
        
        container.spacing = 2
        fill(container)
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 67),
            profileImage.heightAnchor.constraint(equalToConstant: 67),
            profileName.widthAnchor.constraint(equalToConstant: 56)
        ])
        
    }
}
