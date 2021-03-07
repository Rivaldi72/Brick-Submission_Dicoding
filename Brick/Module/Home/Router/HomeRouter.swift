//
//  HomeRouter.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

import SwiftUI
import Core
import Game

class HomeRouter {
    
    func makeDetailView(for gameId: Int) -> some View {
        let detailUseCase : Interactor<
            Int,
            GameDomainModel,
            GetDetailGameRepository<GetAllGamesLocale, DetailGameTransformer>
        > = Injection.init().provideDetail()
        
        let favoriteUseCase: Interactor<Int, Bool, UpdateFavoriteGameRepository<GetAllGamesLocale, DetailGameTransformer>
        > = Injection.init().provideUpdateFavorite()
        
        let presenter = GetDetailPresenter(useCase: detailUseCase)
        presenter.getDetail(request: gameId)
        let favoritePresenter = FavoritePresenter(useCase: favoriteUseCase)
        return DetailView(presenter: presenter, favoritePresenter: favoritePresenter)
    }
 
    func makeFavoriteView() -> some View {
        let favoriteUseCase: Interactor<
            Any,
            [GameDomainModel],
            GetFavoriteGamesRepository<GetFavoriteGamesLocale, AllGameTransformer>
        > = Injection.init().provideFavoriteGame()
        let presenter = GetListPresenter(useCase: favoriteUseCase)
        return FavoriteView(presenter: presenter)
    }
//    
//    func makeSearchView() -> some View {
//        let searchUseCase = Injection.init().provideSearch()
//        let presenter = SearchPresenter(searchUseCase: searchUseCase)
//        return SearchView()
//    }
    
}
