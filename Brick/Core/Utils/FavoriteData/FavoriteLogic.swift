//
//  AddToFavorite.swift
//  Brick
//
//  Created by Rivaldi Aliando on 20/12/20.
//

import SwiftUI
import RealmSwift

struct FavoriteLogic {
    
    func addToFavorite(game: GameModel){
        let config = Realm.Configuration(schemaVersion: 1)
        do {
            let realm = try Realm(configuration: config)
            let games = realm.objects(AllGameEntity.self).filter("id == \(game.id)")
            
            for game in games {
                try realm.write {
                    if game.isFavorite {
                        game.isFavorite = false
                        realm.add(game)
                    } else {
                        game.isFavorite = true
                        realm.add(game)
                    }
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
