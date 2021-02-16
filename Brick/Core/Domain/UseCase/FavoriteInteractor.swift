//
//  FavoriteInteractor.swift
//  Brick
//
//  Created by Bursaku Macbook Air 1 on 11/12/20.
//

import Foundation
import RxSwift

protocol FavoriteUseCase {
       
    func getFavoriteGames() -> Observable<[GameModel]>
  
}

class FavoriteInteractor: FavoriteUseCase {

    private let repository: GameRepositoryProtocol
    
    required init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }

    func getFavoriteGames() -> Observable<[GameModel]> {
        repository.getFavoriteGames()
    }
    
}
