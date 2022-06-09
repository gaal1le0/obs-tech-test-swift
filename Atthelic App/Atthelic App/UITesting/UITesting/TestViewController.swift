//
//  TestViewController.swift
//  UITesting
//
//  Created by Emanuel Martinez on 9/6/22.
//

import UIKit
import AppUtils

extension MedalCounter {
    fileprivate static let GoldValue = MedalCounterModel(counter: "10", type: .Gold)
    fileprivate static let SilverValue = MedalCounterModel(counter: "5", type: .Silver)
    fileprivate static let BronzeValue = MedalCounterModel(counter: "1", type: .Bronze)
}

class TestViewController: UIViewController {
    
    // MARK: Testing properties
    private let mainStackView = Atoms.StackViews.Vertical
    private let medals = [MedalCounter.GoldValue, MedalCounter.SilverValue, MedalCounter.BronzeValue]
    private let medalStackView = Atoms.StackViews.Horizontal

    lazy var allSubviews: [UIView] = {
        return [medalStackView]
    }()
        
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
    
    // MARK: - Methods
    private func prepareMedals() -> [MedalCounter] {
        medals.map {
            let medal = Molecules.Views.Medal
            medal.bind($0)
            return medal
        }
    }

}

extension TestViewController {
    func setupViews() {
        
        view.backgroundColor = .red
        mainStackView.backgroundColor = .lightGray
        navigationItem.title = "Testing View"
        
        let medals = prepareMedals()
        medals.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        medals.forEach { medalStackView.addArrangedSubview($0) }
        medalStackView.translatesAutoresizingMaskIntoConstraints = false
        medalStackView.spacing = 15
        
        allSubviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        allSubviews.forEach { mainStackView.addArrangedSubview($0) }

        mainStackView.spacing = 10
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
    }
}

