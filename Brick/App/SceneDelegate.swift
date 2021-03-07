//
//  SceneDelegate.swift
//  Brick
//
//  Created by Rivaldi Aliando on 28/11/20.
//

import UIKit
import SwiftUI
import Core
import Game

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let allUseCase: Interactor<
            Any,
            [GameDomainModel],
            GetAllGamesRepository<GetAllGamesLocale, GetGamesRemoteDataSource, AllGameTransformer>
        > = Injection.init().provideAllGame()
        
        let latestUseCase: Interactor<
            Any,
            [GameDomainModel],
            GetLatestGamesRepository<GetLatestGamesLocale, GetGamesRemoteDataSource, LatestGameTransformer>
        > = Injection.init().provideLatestGame()
        
        let favoriteUseCase: Interactor<Int, Bool, UpdateFavoriteGameRepository<GetAllGamesLocale, DetailGameTransformer>
        > = Injection.init().provideUpdateFavorite()
        
        let allPresenter = GetListPresenter(useCase: allUseCase)
        let latestPresenter = GetListPresenter(useCase: latestUseCase)
        let favoritePresenter = FavoritePresenter(useCase: favoriteUseCase)

        let contentView = ContentView()
            .environmentObject(allPresenter)
            .environmentObject(latestPresenter)
            .environmentObject(favoritePresenter)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
    
    
}

