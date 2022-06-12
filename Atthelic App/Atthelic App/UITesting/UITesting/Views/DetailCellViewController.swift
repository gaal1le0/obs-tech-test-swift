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
    case medals(MedalsCellModel)
    case text(DescriptionCellModel)
}

class DetailCellViewController: UIViewController {
    
    // MARK: - Properties
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let data: [DetailStateType] = [
        .basic(.init(title: "Name", subtitle: "Naomi Osaka")),
        .basic(.init(title: "Date of Birth", subtitle: "2002")),
        .basic(.init(title: "Weight", subtitle: "100 kg")),
        .basic(.init(title: "Height", subtitle: "120 cm")),
        .medals(.init(title: "Medals", score: .init(gold: 10, silver: 0, bronze: 1))),
        .medals(.init(title: "Medals", score: .init(gold: 0, silver: 0, bronze: 0))),
        .medals(.init(title: "Medals", score: .init(gold: 0, silver: 0, bronze: 1))),
        .medals(.init(title: "Medals", score: .init(gold: 10, silver: 10, bronze: 1))),
        .text(.init(biography: """
        Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
        The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
        """))
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
        case .medals(let model):
            let cell = Molecules.Cells.Medal
            cell.bind(model)
            return cell
        case .text(let model):
            let cell = Molecules.Cells.Description
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

extension DetailCellViewController {
    func setupViews() {
        
        view.backgroundColor = Tokens.Colors.Grayscale.Quaternary
        navigationItem.title = "Cell Detail Testing"
        tableView.backgroundColor = .clear
        
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        tableView.register(BasicCell.self, forCellReuseIdentifier: BasicCell.Identifier)
        tableView.register(MedalsCell.self, forCellReuseIdentifier: MedalsCell.Identifier)
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.Identifier)
        
        view.fill(tableView)
    }
}
