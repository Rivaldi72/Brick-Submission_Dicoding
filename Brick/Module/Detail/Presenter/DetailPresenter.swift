//
//  DetailPresenter.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

import SwiftUI

class DetailPresenter: ObservableObject {

  private let detailUseCase: DetailUseCase

  @Published var game: GameModel
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false

  init(detailUseCase: DetailUseCase) {
    self.detailUseCase = detailUseCase
    game = detailUseCase.getGame()
  }
    
    func addToFavorite(game: GameModel) {
        detailUseCase.addToFavorite(game: game)
    }

}
