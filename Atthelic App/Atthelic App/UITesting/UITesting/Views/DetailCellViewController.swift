//
//  DetailCellViewController.swift
//  UITesting
//
//  Created by Emanuel Martinez on 10/6/22.
//

import Foundation
import UIKit
import AppUtils

enum DetailStateType {
    case basic(BasicCellModel)
    case medals //TODO: Pending
    case text //TODO: Pending
}

class DetailCellViewController: UIViewController {
    
    // MARK: - Properties
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let data: [DetailStateType] = [
        .basic(.init(title: "Name", subtitle: "Naomi Osaka")),
        .basic(.init(title: "Date of Birth", subtitle: "2002")),
        .basic(.init(title: "Weight", subtitle: "100 kg")),
        .basic(.init(title: "Height", subtitle: "120 cm")),
    ]
    
    // MARK: - Inits
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

}

extension DetailCellViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data[indexPath.row] {
        case .basic(let model):
            let cell = Molecules.Cells.Basic
            cell.bind(model)
            return cell
        case .medals:
            return UITableViewCell()
        case .text:
            return UITableViewCell()
        }
    }
}

extension DetailCellViewController {
    func setupViews() {
        
        view.backgroundColor = Tokens.Colors.Grayscale.Quaternary
        navigationItem.title = "Cell Detail Testing"
        tableView.backgroundColor = .clear
        view.rounded()
        
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.rowHeight = 40
        tableView.estimatedRowHeight = 40
        tableView.register(BasicCell.self, forCellReuseIdentifier: BasicCell.Identifier)
        
        view.fill(tableView)
    }
}
