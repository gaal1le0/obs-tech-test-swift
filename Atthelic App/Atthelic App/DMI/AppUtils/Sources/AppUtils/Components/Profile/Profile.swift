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
    var tapOnImageCb: (() -> Void)?
    
    lazy var allSubviews: [UIView] = {
        return [profileImage, profileName]
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
        profileImage.image = model.profileImage
        profileName.text = model.fullName
        tapOnImageCb = model.onTouchUpInside
    }
    
    @objc
    func tapOnImage() {
        tapOnImageCb?()
    }
    
}

extension Profile {
    func setupViews() {
        
        profileImage.contentMode = .scaleToFill
        profileImage.circular()
        profileImage.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage))
        profileImage.addGestureRecognizer(tapGesture)
        
        profileName.numberOfLines = 2
        profileName.textAlignment = .center
        profileName.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { container.addArrangedSubview($0) }
        
        container.spacing = 18
        fill(container)
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 67),
            profileName.widthAnchor.constraint(equalToConstant: 56)
        ])
        
    }
}
