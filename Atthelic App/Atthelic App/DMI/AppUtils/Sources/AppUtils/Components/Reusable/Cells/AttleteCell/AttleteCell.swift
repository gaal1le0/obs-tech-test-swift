//
//  AttleteCell.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation
import UIKit

public class AttleteCell: UICollectionViewCell {
    
    // MARK: - Properties
    public static let Identifier = "AttleteCell.Identifier.Cell"
    let view = Molecules.Views.ProfileView
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    public func bind(_ model: ProfileModel) {
        view.bind(model)
    }
    
}

extension AttleteCell {
    func setupViews() {
        fill(view)
    }
}
