//
//  MainViewController.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Dependencies
    var model: MainViewInput?
    
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
            
        
    }
    
}

extension MainViewController: MainViewOutput {
    
    func update(_ state: MainViewState) {
        switch state {
        case .loading:
            print("Loading")
        case .error(let error):
            print("ERROR \(error.localizedDescription)")
        case .data(let array):
            print("heyyyyyy")
            print(array)
            print("Adiosss")
        }
    }
    
}

