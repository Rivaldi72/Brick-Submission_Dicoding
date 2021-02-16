//
//  HomeRouter.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

import SwiftUI

class HomeRouter {
    
    func makeDetailView(for game: GameModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(game: game)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter)
    }
    
    func makeFavoriteView() -> some View {
        let favoriteUseCase = Injection.init().provideFavorite()
        let presenter = FavoritePresenter(favoriteUseCase: favoriteUseCase)
        return FavoriteView(presenter: presenter)
    }
    
    func makeSearchView() -> some View {
        let searchUseCase = Injection.init().provideSearch()
//        let presenter = SearchPresenter(searchUseCase: searchUseCase)
        return SearchView()
    }
    
}
