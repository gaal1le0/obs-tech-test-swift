//
//  SplashScreenView.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import UIKit
import AppUtils

class SplashScreenView: UIViewController {
    
    // MARK: - Depedencies
    var model: SplashScreenInput?
    private let logo = UIImageView()
    private let titleLogo = UILabel(frame: .zero)
    
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

extension SplashScreenView {
    
    func setupViews() {
        view.backgroundColor = .white
        
        logo.image = UIImage(named: "splash_logo")
        logo.contentMode = .scaleAspectFit
        
        let title = NSMutableAttributedString(string: "PARIS 2024")
        title.setColorForText("PARIS", with: Tokens.Colors.Grayscale.Primary)
        title.setColorForText("2024", with: Tokens.Colors.Grayscale.Secondary)
        //TODO: Change size and font
        
        titleLogo.attributedText = title
        titleLogo.textAlignment = .center
        titleLogo.translatesAutoresizingMaskIntoConstraints = false
        logo.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(logo)
        view.addSubview(titleLogo)
        
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLogo.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 12),
            titleLogo.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
    }
}
