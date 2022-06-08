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
    private let loader = Molecules.Spinner
    private let errorView = Molecules.Views.Error
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
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
        
        errorView.translatesAutoresizingMaskIntoConstraints = false
        
        loader.bind(.init(.black)) //TODO: Change for tokens
        loader.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .green
        
        view.addSubview(loader)
        view.addSubview(errorView)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            loader.widthAnchor.constraint(equalTo: view.widthAnchor),
            loader.heightAnchor.constraint(equalTo: view.heightAnchor),
            errorView.heightAnchor.constraint(equalTo: view.heightAnchor),
            errorView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension MainViewController: MainViewOutput {
    
    func update(_ state: MainViewState) {
        switch state {
        case .loading:
            self.loader.start()
            self.tableView.isHidden = true
            self.errorView.isHidden = true
        case .error(let error):
            self.loader.stop()
            self.tableView.isHidden = true
            self.errorView.isHidden = false
            self.errorView.bind(.init(error))
        case .data(let array):
            self.loader.stop()
            self.errorView.isHidden = true
            self.tableView.isHidden = false
            print("heyyyyyy")
            print(array)
            print("Adiosss")
        }
    }
    
}

