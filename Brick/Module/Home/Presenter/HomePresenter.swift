//
//  HomePresenter.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

import SwiftUI
import RxSwift

class HomePresenter: ObservableObject {
    
    private let router = HomeRouter()
    private let homeUseCase: HomeUseCase
    private let disposeBag = DisposeBag()
    
    @Published var allGames: [GameModel] = []
    @Published var latestGames: [GameModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
    
    func getAllGames() {
        loadingState = true
        homeUseCase.getAllGames()
            .observeOn(MainScheduler.instance)
            .subscribe { result in
                self.allGames = result
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.loadingState = false
            }.disposed(by: disposeBag)
    }
    
    func getLatestGames() {
        loadingState = true
        homeUseCase.getLatestGames()
            .observeOn(MainScheduler.instance)
            .subscribe { result in
                self.latestGames = result
                self.latestGames[0].show = true
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.loadingState = false
            }.disposed(by: disposeBag)
    }
    
    func addToFavorite(game: GameModel) {
        homeUseCase.addToFavorite(game: game)
        getAllGames()
    }
    
    func linkBuilder<Content: View>(
        for game: GameModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeDetailView(for: game)) { content() }
    }
    
    func linkFavoriteBuilder<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeFavoriteView()) { content() }
    }
    
    func linkSearchBuilder<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeSearchView()) { content() }
    }
    
}
