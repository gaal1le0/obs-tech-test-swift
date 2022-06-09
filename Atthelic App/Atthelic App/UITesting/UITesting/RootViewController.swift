//
//  RootViewController.swift
//  UITesting
//
//  Created by Emanuel Martinez on 9/6/22.
//

import Foundation
import UIKit
import AppUtils

class RootViewController: UIViewController {
    
    // MARK: - Properties
    private let tableView = UITableView(frame: .zero)
    private let vcs: [(title: String, view: UIViewController)] = [
        (title: "Example base components", TestViewController())
    ]
    
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
    
}

extension RootViewController {
    func setupViews() {
        
        navigationItem.title = "Base Testing"
        tableView.backgroundColor = .white
        view.backgroundColor = .yellow.withAlphaComponent(0.8)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        
        view.fill(tableView)
    }
}

extension RootViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.vcs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = vcs[indexPath.row].title
        return cell
    }
}

extension RootViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = vcs[indexPath.row].view
        navigationController?.pushViewController(view, animated: true)
    }
}
