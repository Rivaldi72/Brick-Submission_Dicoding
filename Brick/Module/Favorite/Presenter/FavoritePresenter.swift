//
//  FavoritePresenter.swift
//  Brick
//
//  Created by Rivaldi Aliando on 20/12/20.
//

import SwiftUI
import RxSwift

class FavoritePresenter: ObservableObject {
    
    private let router = FavoriteRouter()
    private let favoriteUseCase: FavoriteUseCase
    private let disposeBag = DisposeBag()
    
    @Published var errorMessage: String = ""
    @Published var favoriteGames: [GameModel] = []
    @Published var loadingState: Bool = false
    
    init(favoriteUseCase: FavoriteUseCase) {
        self.favoriteUseCase = favoriteUseCase
    }
    
    func getFavoriteGames() {
        loadingState = true
        favoriteUseCase.getFavoriteGames()
            .observeOn(MainScheduler.instance)
            .subscribe { result in
                self.favoriteGames = result
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.loadingState = false
            }.disposed(by: disposeBag)
    }
    
    func linkBuilder<Content: View>(
        for game: GameModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeDetailView(for: game)) { content() }
    }
}

