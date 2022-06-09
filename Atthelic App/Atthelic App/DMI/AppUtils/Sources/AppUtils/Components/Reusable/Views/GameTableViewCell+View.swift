//
//  GameTableViewCell+View.swift
//  
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation
import UIKit

public class GameTableViewCellView: UIView {
    
    // MARK: - Properties
    let collectionView = UICollectionView(frame: .zero)
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
}
