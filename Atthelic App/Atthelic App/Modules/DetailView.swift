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
    private let container = Atoms.StackViews.Vertical
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let profileImage = UIImageView(frame: .zero)
    
    lazy var allSubviews: [UIView] = {
        return [profileImage, tableView]
    }
    
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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data[indexPath.row] {
        case .basic(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BasicCell.Identifier, for: indexPath) as? BasicCell else {
                fatalError("Have you registered the cell?")
            }
            cell.bind(model)
            return cell
        case .medals(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MedalsCell.Identifier, for: indexPath) as? BasicCell else {
                fatalError("Have you registered the cell?")
            }
            cell.bind(model)
            return cell
        case .text(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.Identifier, for: indexPath) as? BasicCell else {
                fatalError("Have you registered the cell?")
            }
            cell.bind(model)
            return cell
        }
    }
}

extension DetailCellViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension DetailView {
    
    func setupViews() {
            
        view.backgroundColor = Tokens.Colors.Grayscale.Quaternary
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.retryButton.addTarget(self, action: #selector(retryLoadingData), for: .touchUpInside)
        
        loader.bind(.init(.black))
        loader.translatesAutoresizingMaskIntoConstraints = false
        
        profileImage.circular()
        profileImage.layer.borderColor = Tokens.Colors.Tint.Secondary.Tone1
        profileImage.layer.borderWidth = 3
        
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(BasicCell.self, forCellReuseIdentifier: BasicCell.Identifier)
        tableView.register(MedalsCell.self, forCellReuseIdentifier: MedalsCell.Identifier)
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.Identifier)
        
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { container.addArrangedSubview($0) }
        container.spacing = 15
        
        fill(loader)
        fill(errorView)
        fill(tableView)
        
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
            
        case .data(let modelData):
            self.loader.stop()
            self.errorView.isHidden = true
            self.errorView.retryButton.isUserInteractionEnabled = false
            self.viewDomainObject = modelData.domModel
            // TODO: Fix photo
            // TODO: Fix navigation title
            
        }
    }
}
