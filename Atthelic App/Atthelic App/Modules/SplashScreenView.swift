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
    private let container = Atoms.StackViews.Vertical
    private let logo = UIImageView()
    private let titleLogo = UILabel(frame: .zero)
    
    lazy var allSubviews: [UIView] = {
        return [logo, titleLogo]
    }()
    
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
        title.setFontFamilyForText("PARIS", with: .systemFont(ofSize: 20.0, weight: .bold))
        title.setColorForText("2024", with: Tokens.Colors.Grayscale.Secondary)
        title.setFontFamilyForText("2024", with: .systemFont(ofSize: 20.0, weight: .thin))
        
        titleLogo.attributedText = title
        titleLogo.textAlignment = .center
        
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { container.addArrangedSubview($0) }
        
        container.spacing = 12
        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)
        
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLogo.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
    }
}
