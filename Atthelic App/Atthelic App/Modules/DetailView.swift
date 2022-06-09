//
//  DetailView.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import UIKit
import AppUtils

class DetailView: UIViewController {
    
    // MARK: - Properties
    private let loader = Molecules.Spinner
    private let errorView = Molecules.Views.Error
    
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
    
    // MARK: - Methods
    @objc
    func retryLoadingData() {
        model?.retryLoadingData()
    }
    
}

extension DetailView {
    
    func setupViews() {
            
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.retryButton.addTarget(self, action: #selector(retryLoadingData), for: .touchUpInside)
        
        loader.bind(.init(.black))
        loader.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loader)
        view.addSubview(errorView)
        
        NSLayoutConstraint.activate([
            loader.widthAnchor.constraint(equalTo: view.widthAnchor),
            loader.heightAnchor.constraint(equalTo: view.heightAnchor),
            errorView.heightAnchor.constraint(equalTo: view.heightAnchor),
            errorView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
        ])
        
    }
    
}

extension DetailView: DetailViewOutput {
    
    func configureNavigationBarTitle(_ title: String) {
        navigationController?.navigationBar.topItem?.title = title
    }
    
    func update(_ state: DetailState) {
        switch state {
        case .loading:
            self.loader.start()
            self.errorView.isHidden = true
            self.errorView.retryButton.isUserInteractionEnabled = false
            
        case .error(let error):
            self.loader.stop()
            self.errorView.isHidden = false
            self.errorView.bind(.init(error, retryButtonText: "Try again"))
            self.errorView.retryButton.isUserInteractionEnabled = true
            
        case .data:
            self.loader.stop()
            self.errorView.isHidden = true
            self.errorView.retryButton.isUserInteractionEnabled = false

            
        }
    }
}
