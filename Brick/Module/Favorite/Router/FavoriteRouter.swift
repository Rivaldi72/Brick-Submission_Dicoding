//
//  FavoriteRouter.swift
//  Brick
//
//  Created by Rivaldi Aliando on 20/12/20.
//

import SwiftUI

class FavoriteRouter {
    
    func makeDetailView(for game: GameModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(game: game)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter)
    }
    
}
