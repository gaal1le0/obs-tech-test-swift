//
//  MainViewController.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import UIKit
import AppUtils

class MainViewController: UIViewController {
    
    // MARK: - Dependencies
    var model: MainViewInput?
    private var loader = Molecules.Spinner
    
    // MARK: - Inits
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        model?.viewWillAppear()
    }

}

extension MainViewController {
    
    func setupViews() {
        
        view.backgroundColor = .red
        navigationController?.navigationBar.topItem?.title = "Olympic Athletes"
        
        loader.bind(.init(.black)) //TODO: Change for tokens
        loader.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loader)
        NSLayoutConstraint.activate([
            loader.widthAnchor.constraint(equalTo: view.widthAnchor),
            loader.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
    }
    
}

extension MainViewController: MainViewOutput {
    
    func update(_ state: MainViewState) {
        switch state {
        case .loading:
            self.loader.start()
        case .error(let error):
            self.loader.stop()
        case .data(let array):
            self.loader.stop()
            print("heyyyyyy")
            print(array)
            print("Adiosss")
        }
    }
    
}

