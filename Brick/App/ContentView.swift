//
//  ContentView.swift
//  Brick
//
//  Created by Rivaldi Aliando on 28/11/20.
//

import SwiftUI
import Core
import Game

struct ContentView: View {
    @EnvironmentObject var allGamePresenter: GetListPresenter<Any, GameDomainModel, Interactor<Any, [GameDomainModel], GetAllGamesRepository<GetAllGamesLocale, GetGamesRemoteDataSource, AllGameTransformer>>>
    
    @EnvironmentObject var latestGamePresenter: GetListPresenter<Any, GameDomainModel, Interactor<Any, [GameDomainModel], GetLatestGamesRepository<GetLatestGamesLocale, GetGamesRemoteDataSource, LatestGameTransformer>>>
    
    @EnvironmentObject var favoritePresenter: FavoritePresenter<Int, Bool, Interactor<Int, Bool, UpdateFavoriteGameRepository<GetAllGamesLocale, DetailGameTransformer>>>
    
    var body: some View {
        NavigationView {
            HomeView(allGamePresenter: allGamePresenter, latestGamePresenter: latestGamePresenter, favoritePresenter: favoritePresenter)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
