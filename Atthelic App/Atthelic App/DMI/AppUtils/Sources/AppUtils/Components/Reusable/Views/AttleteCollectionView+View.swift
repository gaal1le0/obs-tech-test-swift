//
//  AttleteCollectionView+View.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation
import UIKit

public class AttleteCollectionViewView: UIView {
    
    // MARK: - Properties
    let profileView = Profile()
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Inits
    public func bind(_ model: ProfileModel) {
        profileView.bind(model)
    }
    
}

extension AttleteCollectionViewView {
    func setupViews() {
        fill(profileView)
    }
}
