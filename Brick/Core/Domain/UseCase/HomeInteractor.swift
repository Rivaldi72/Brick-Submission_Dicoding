//
//  HomeInteractor.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

import Foundation
import RxSwift

protocol HomeUseCase {
    
    func getAllGames() -> Observable<[GameModel]>
    
    func getLatestGames() -> Observable<[GameModel]>
    
    func getFavoriteGames() -> Observable<[GameModel]>
    
    func addToFavorite(game: GameModel)
}

class HomeInteractor: HomeUseCase {
   
    private let repository: GameRepositoryProtocol
    
    required init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }
    
    func getAllGames() -> Observable<[GameModel]> {
        return repository.getAllGames()
    }
    
    func getLatestGames() -> Observable<[GameModel]> {
        return repository.getLatestGames()
    }
    
    func getFavoriteGames() -> Observable<[GameModel]> {
        return repository.getFavoriteGames()
    }
    
    func addToFavorite(game: GameModel) {
        self.repository.addToFavorite(game: game)
    }
}
