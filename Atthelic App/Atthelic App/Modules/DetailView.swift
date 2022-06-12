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
    private var viewDomainObject: [DetailStateType] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
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

extension DetailView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewDomainObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewDomainObject[indexPath.row] {
        case .basic(let model):
            let cell = Molecules.Cells.Basic
            cell.bind(model)
            return cell
        case .medals(let model):
            let cell = Molecules.Cells.Medal
            cell.bind(model)
            return cell
        case .text(let model):
            let cell = Molecules.Cells.Description
            cell.bind(model)
            return cell
        case .photo(let model):
            let cell = Molecules.Cells.Photo
            cell.bind(model)
            return cell
        }
    }
}

extension DetailView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension DetailView {
    
    func setupViews() {
            
        navigationController?.navigationBar.topItem?.title = ""
        view.backgroundColor = Tokens.Colors.Grayscale.Quaternary
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.isUserInteractionEnabled = true
        errorView.retryButton.addTarget(self, action: #selector(retryLoadingData), for: .touchUpInside)
        
        loader.bind(.init(.black, format: .medium))
        loader.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(BasicCell.self, forCellReuseIdentifier: BasicCell.Identifier)
        tableView.register(MedalsCell.self, forCellReuseIdentifier: MedalsCell.Identifier)
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.Identifier)
        tableView.register(PhotoCell.self, forCellReuseIdentifier: PhotoCell.Identifier)
        
        view.fill(loader)
        view.addSubview(errorView)
        view.fill(tableView)
        
        NSLayoutConstraint.activate([
            errorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }
    
}

extension DetailView: DetailViewOutput {
    
    func configureNavigationBarTitle(_ title: String) {
        self.title = title
    }
    
    func update(_ state: DetailState) {
        switch state {
        case .loading:
            self.loader.start()
            self.errorView.isHidden = true
            
        case .error(let error):
            self.loader.stop()
            self.errorView.isHidden = false
            self.errorView.bind(.init(error, retryButtonText: "Try again"))
            
        case .data(let modelData):
            self.viewDomainObject = modelData.domModel
            self.errorView.isHidden = true
            self.loader.stop()
        }
    }
}
