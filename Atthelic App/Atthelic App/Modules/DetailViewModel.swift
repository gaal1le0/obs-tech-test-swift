//
//  DetailViewModel.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import Services

class DetailViewModel {
    
    // MARK: - Depedencies
    weak private var view: DetailViewOutput?
    private let service: DetailViewDataProvider
    private let attleteId: String
    private let attleteFullName: String
    
    // MARK: - Properties
    var state: DetailState = .loading {
        didSet {
            self.view?.update(state)
        }
    }
    var dom: Atthelete? = nil {
        didSet {
            self.transformToViewObject()
        }
    }
    
    // MARK: - Inits
    init(_ view: DetailViewOutput, service: DetailViewDataProvider, attleteId: String, attleteFullName: String) {
        self.view = view
        self.service = service
        self.attleteId = attleteId
        self.attleteFullName = attleteFullName
    }
    
    deinit {
        print("Deinit DetailViewModel")
    }
    
    // MARK: - Methods    
    private func transformToViewObject() {
        if let att = self.dom {
            state = .data(.init(fullName: att.fullName, domModel: [
                .photo(.init(photoURL: att.photoURL!)),
                .basic(.init(title: "Name", subtitle: att.fullName)),
                .basic(.init(title: "Date of Birth", subtitle: att.dateOfBirthFormatted)),
                .basic(.init(title: "Weight", subtitle: att.measure.fullWeight)),
                .basic(.init(title: "Height", subtitle: att.measure.fullHeight)),
                .medals(.init(title: "Medals", score: .init(gold: att.score?.gold ?? 0, silver: att.score?.silver ?? 0, bronze: att.score?.bronze ?? 0))),
                .text(.init(biography: att.biography))
            ]))
        }
    }
    
    private func getAttleteScoreData(dto: AttheleteDTO) {
        service.getAttleteScore(attleteId: self.attleteId) { attleteScoreCompletion in
            switch attleteScoreCompletion {
            case .failure(_):
                self.state = .error("API is not available. General error.")
            case .success(let scoreDTO):
                self.dom = .init(dto, scores: scoreDTO.map(AttleteScore.init))
            }
        }
    }
    
    private func loadData() {
        service.getAttleteDetailById(attleteId: self.attleteId) { attleteCompletion in
            switch attleteCompletion {
            case .failure(_):
                self.state = .error("API is not available. General error.")
            case .success(let attleteDTO):
                self.getAttleteScoreData(dto: attleteDTO)
            }
        }
    }
    
}

extension DetailViewModel: DetailViewInput {
    func viewWillAppear() {
        state = .loading
        view?.configureNavigationBarTitle("\(self.attleteFullName) Details")
        loadData()
    }
    
    func retryLoadingData() {
        loadData()
    }
}
