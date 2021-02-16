//
//  DetailInteractor.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

import Foundation

protocol DetailUseCase {
    
    func getGame() -> GameModel
    
    func addToFavorite(game: GameModel)
}

class DetailInteractor: DetailUseCase {
      
    private let repository: GameRepositoryProtocol
    private let game: GameModel
    
    required init(
        repository: GameRepositoryProtocol,
        game: GameModel
    ) {
        self.repository = repository
        self.game = game
    }
    
    func getGame() -> GameModel {
        return game
    }
    
    func addToFavorite(game: GameModel) {
        self.repository.addToFavorite(game: game)
    }
   
}
