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
    private var domainViewModel: [GameCellModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
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

    // MARK: - Methods
    @objc
    func retryLoadingData() {
        model?.retryLoadingData()
    }
    
}

extension MainViewController {
    
    func setupViews() {
        
        view.backgroundColor = Tokens.Colors.Grayscale.Tertiary
        navigationController?.navigationBar.topItem?.title = "Olympic Athletes"
        
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.retryButton.addTarget(self, action: #selector(retryLoadingData), for: .touchUpInside)
        
        loader.bind(.init(.black, format: .medium))
        
        tableView.backgroundColor = .clear
        
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.rowHeight = 191
        tableView.estimatedRowHeight = 191
        tableView.register(GameCell.self, forCellReuseIdentifier: GameCell.Identifier)
        
        view.fill(loader)
        view.addSubview(errorView)
        view.fill(tableView)
        
        NSLayoutConstraint.activate([
            errorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        domainViewModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameCell.Identifier, for: indexPath) as? GameCell else {
            fatalError("Have you registered the cell?")
        }
        cell.bind(domainViewModel[indexPath.section])
        return cell
    }
    
}

extension MainViewController: MainViewOutput {
    
    func update(_ state: MainViewState) {
        switch state {
        case .loading:
            self.loader.start()
            self.tableView.isHidden = true
            self.errorView.isHidden = true
            self.errorView.retryButton.isUserInteractionEnabled = false
            
        case .error(let error):
            self.loader.stop()
            self.tableView.isHidden = true
            self.errorView.isHidden = false
            self.errorView.bind(.init(error, retryButtonText: "Try again"))
            self.errorView.retryButton.isUserInteractionEnabled = true
            
        case .data(let viewDomainModel):
            self.loader.stop()
            self.errorView.isHidden = true
            self.tableView.isHidden = false
            self.errorView.retryButton.isUserInteractionEnabled = false
            self.domainViewModel = viewDomainModel
        }
    }
    
}

