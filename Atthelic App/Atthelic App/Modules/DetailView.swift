//
//  DetailView.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import UIKit

class DetailView: UIViewController {
    
    // MARK: - Dependencies
    var model: DetailViewInput?
    
    // MARK: - Inits
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        model?.viewWillAppear()
    }
    
}

extension DetailView {
    
    func setupViews() {
        
    }
    
}

extension DetailView: DetailViewOutput {
    func update(_ state: DetailState) {
        #warning("Configure view depending on the state")
    }
}
