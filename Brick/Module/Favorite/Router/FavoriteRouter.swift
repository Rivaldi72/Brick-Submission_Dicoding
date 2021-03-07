//
//  FavoriteRouter.swift
//  Brick
//
//  Created by Rivaldi Aliando on 20/12/20.
//

import SwiftUI
import Core
import Game

class FavoriteRouter {
    
    func makeDetailView(for gameId: Int) -> some View {
        let detailUseCase : Interactor<
            Int,
            GameDomainModel,
            GetDetailGameRepository<GetAllGamesLocale, DetailGameTransformer>
        > = Injection.init().provideDetail()
        
        let favoriteUseCase: Interactor<Int, Bool, UpdateFavoriteGameRepository<GetAllGamesLocale, DetailGameTransformer>
        > = Injection.init().provideUpdateFavorite()
        
        let presenter = GetDetailPresenter(useCase: detailUseCase)
        let favoritePresenter = FavoritePresenter(useCase: favoriteUseCase)
        return DetailView(presenter: presenter, favoritePresenter: favoritePresenter)
    }
    
}
