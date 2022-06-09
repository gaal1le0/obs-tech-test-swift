//
//  MainViewModel.swift
//  Atthelic App
//
//  Created by Emanuel Martinez on 7/6/22.
//

import Foundation

class MainViewModel {
    
    // MARK: - Dependencies
    weak private var view: MainViewOutput?
    private let router: MainViewRouter
    private let service: MainViewDataProvider
    
    // MARK: - Properties
    private var state: MainViewState = .loading {
        didSet {
            self.view?.update(state)
        }
    }
    private var dom: [MainViewStateDataState] = [] {
        didSet {
            if !dom.isEmpty {
                self.state = .data(dom)
            } else {
                self.state = .error("There's no data to show")
            }
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
    private func getAttleteInfo(_ gameId: Int) {
        service.getAttletes(gameId: String(gameId)) { attleteResults in
            switch attleteResults {
            case .failure(let error):
                self.dom = self.dom.map { state -> MainViewStateDataState in
                    if state.id == gameId {
                        return .init(
                            id: state.id, headerTitle: state.headerTitle, state: .error(error.localizedDescription)
                        )
                    }
                    return state
                }
            case .success(let attletes):
                if !attletes.isEmpty {
                    self.dom = self.dom.map { state -> MainViewStateDataState in
                        if state.id == gameId {
                            return .init(
                                id: state.id, headerTitle: state.headerTitle, state: .data(
                                     []
                                )
                            )
                        }
                        return state
                    }
                } else {
                    self.dom = self.dom.map { state -> MainViewStateDataState in
                        if state.id == gameId {
                            return .init(
                                id: state.id, headerTitle: state.headerTitle, state: .error("There's no attlete on this game")
                            )
                        }
                        return state
                    }
                }
            }
            
        }
    }
    
    private func getGroupData() {
        state = .loading
        service.getGameDTO { gamesCompletion in
            switch gamesCompletion {
            case .failure(let error): self.state = .error(error.localizedDescription)
            case .success(let games):
                self.dom = games.map(Game.init).sorted {$0 > $1}.map {
                    self.getAttleteInfo($0.id)
                    return .init(id: $0.id, headerTitle: $0.asHeaderTitleFormatted, state: .loading)
                }
            }
        }
    }
    
}

extension MainViewModel: MainViewInput {
    func viewWillAppear() {
//        getGroupData()
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.state = .error("Example")
        }
    }
    
    func retryLoadingData() {
        print(">>> Retry loading data from API")
        getGroupData()
    }
}
