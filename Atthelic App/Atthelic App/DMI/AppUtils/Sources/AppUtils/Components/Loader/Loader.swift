//
//  Loader.swift
//  
//
//  Created by Emanuel Martinez on 8/6/22.
//

import Foundation
import UIKit

public class Loader: UIView {
    
    // MARK: - Properties
    private let activityIndicator = UIActivityIndicatorView()
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    public func bind(_ model: LoaderModel) {
        activityIndicator.color = model.color
        activityIndicator.style = model.format
    }
    
    public func start() {
        isHidden = false
        activityIndicator.startAnimating()
    }
    
    public func stop() {
        activityIndicator.stopAnimating()
        isHidden = true
    }
    
}

extension Loader {
    func setupViews() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.widthAnchor.constraint(equalToConstant: 40.0),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
