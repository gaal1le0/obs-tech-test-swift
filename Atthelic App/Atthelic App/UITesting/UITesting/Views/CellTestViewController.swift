//
//  CellTestViewController.swift
//  UITesting
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation
import UIKit
import AppUtils

class CellTestViewController: UIViewController {
    
    // MARK: - Properties
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let dataset: [GameCellModel] = [
        .init(header: .init(gameName: "Olympics", gameYear: "2022"), state: .error(
            .init(message: "Example error view", tapOnRetry: {
                print("Retry fetching attletes from Olympics")
            })
        )),
        .init(header: .init(gameName: "Olympics 2", gameYear: "2025")),
        .init(header: .init(gameName: "Olympics 3", gameYear: "2023"), state: .data(
            .init(attletes: [
                .init(fullName: "Manolo Escobar", profileImage: UIImage(named: "exampleProfile")!),
                .init(fullName: "Manolo Perex", profileImage: UIImage(named: "exampleProfile")!),
                .init(fullName: "Manolo Gutierrez", profileImage: UIImage(named: "exampleProfile")!),
                .init(fullName: "Manolo Mong", profileImage: UIImage(named: "exampleProfile")!),
                .init(fullName: "Manolo Sevillano", profileImage: UIImage(named: "exampleProfile")!)
            ], callback: { index in
                print("Selected value \(index)")
            })
        ))
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

extension CellTestViewController {
    func setupViews() {
    
        view.backgroundColor = Tokens.Colors.Grayscale.Quaternary
        navigationItem.title = "Cell Testing"
        tableView.backgroundColor = .clear
        
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.rowHeight = 191
        tableView.estimatedRowHeight = 191
        tableView.register(GameCell.self, forCellReuseIdentifier: GameCell.Identifier)
        
        view.fill(tableView)
    }
}

extension CellTestViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        dataset.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Molecules.Cells.Game
        cell.bind(dataset[indexPath.section])
        return cell
    }
}
