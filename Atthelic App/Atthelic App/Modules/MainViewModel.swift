//
//  MainViewModel.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation
import AppUtils
import Services
import UIKit

class MainViewModel {
    
    // MARK: - Dependencies
    weak private var view: MainViewOutput?
    let router: MainViewRouter
    private let service: MainViewDataProvider
    
    // MARK: - Properties
    var state: MainViewState = .loading {
        didSet {
            self.view?.update(state)
        }
    }
    var dom: [Game] = [] {
        didSet {
            transformToViewDTO()
        }
    }
    
    // MARK: - Inits
    init(_ view: MainViewOutput, router: MainViewRouter, service: MainViewDataProvider) {
        self.view = view
        self.router = router
        self.service = service
    }
    
    deinit {
        print(">>> Deinit MainViewModel")
    }
    
    // MARK: - Methods
    private func transformToViewDTOHelper(value: Game, index: Int) -> GameCellState {
        if let att = value.attletes {
            if !value.isLoading {
                if att.count > 0 {
                    return .data(.init(attletes: att.map {
                        ProfileModel(fullName: $0.fullName, profileImageURL:$0.photoURL!)
                    }, callback: { index in
                        self.router.showAttleteDetails(att[index].id, attleteFullName: att[index].fullName)
                    }))
                }
                return .error(.init(message: "There's no attlete to show :(", tapOnRetry: {
                    if index != -1 {
                        print(">>> Reload data due to invalid dataset")
                        self.dom[index].isLoading = true
                        self.getAttleteInfo(value, index: index)
                    }
                }))
            }
            return .loading
        }
        return .error(.init(message: "Impossible to laod data from API", tapOnRetry: {
            if index != -1 {
                print(">>> Reloading data due to internal API error")
                self.dom[index].isLoading = true
                self.getAttleteInfo(value, index: index)
            }
        }))
    }
    
    private func transformToViewDTO(index: Int = -1) {
        if dom.count > 0 {
            self.state = .data(
                self.dom.sorted(by: { $0 < $1 })
                    .map { value -> GameCellModel in
                        .init(header: .init(gameName: value.title, gameYear: String(value.yearRaw)), state: self.transformToViewDTOHelper(value: value, index: index))
                }
            )
        }
    }
    
    private func getScorebyAttlete(attleteDTO: AttheleteDTO, gameCity: String, gameYear: Int, index: Int) {
        service.getAttleteScore(attleteId: attleteDTO.athlete_id) { scoreCompletion in
            switch scoreCompletion {
            case .failure(_):
                self.dom[index].attletes = nil
            case .success(let scoreDTO):
                if let score = scoreDTO.first(where: { scoreItem in
                    scoreItem.year == gameYear && scoreItem.city == gameCity
                }) {
                    self.dom[index].attletes?.append(Atthelete.init(attleteDTO, score: AttleteScore.init(score)))
                } else {
                    self.dom[index].attletes?.append(Atthelete.init(attleteDTO, score: nil))
                }
                self.transformToViewDTO(index: index)
            }
        }
    }
    
    private func getAttleteInfo(_ game: Game, index: Int) {
        service.getAttletes(gameId: String(game.id)) { results in
            switch results {
            case .failure(_):
                self.dom[index].attletes = nil
            case .success(let domAttletes):
                if domAttletes.count > 0 {
                    domAttletes.forEach {
                        self.getScorebyAttlete(attleteDTO: $0, gameCity: game.title, gameYear: game.yearRaw, index: index)
                    }
                } else {
                    self.dom[index].isLoading = false
                }
            }
        }
    }
    
    private func getGroupData() {
        state = .loading
        service.getGameDTO { gamesCompletion in
            switch gamesCompletion {
            case .failure(_):
                self.state = .error("It's impossible to call API Data")
            case .success(let games):
                self.dom = games.map { Game($0) }.sorted {$0 < $1}
                self.dom.enumerated().forEach {
                    self.getAttleteInfo($1, index: $0)
                }
            }
        }
    }
    
}

extension MainViewModel: MainViewInput {
    func viewWillAppear() {
        getGroupData()
    }
    
    func retryLoadingData() {
        print(">>> Retry loading data from API")
        getGroupData()
    }
}
