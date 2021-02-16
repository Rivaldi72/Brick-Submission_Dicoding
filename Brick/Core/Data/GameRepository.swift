//
//  GameRepository.swift
//  Brick
//
//  Created by Rivaldi Aliando on 28/11/20.
//

import Foundation
import RxSwift

protocol GameRepositoryProtocol {
    
    func getAllGames() -> Observable<[GameModel]>
    
    func getLatestGames() -> Observable<[GameModel]>
    
    func getFavoriteGames() -> Observable<[GameModel]>
    
    func addToFavorite(game: GameModel)
    
}

final class GameRepository: NSObject {
    
    typealias GameInstance = (LocaleDataSource, RemoteDataSource) -> GameRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    
    private init(locale: LocaleDataSource, remote: RemoteDataSource) {
        self.remote = remote
        self.locale = locale
    }
    
    static let sharedInstance: GameInstance = {localeRepo, remoteRepo in
        return GameRepository(locale: localeRepo, remote: remoteRepo)
    }
    
}

extension GameRepository: GameRepositoryProtocol {
    
    func getAllGames() -> Observable<[GameModel]> {
        return self.locale.getAllGames()
            .map { GameMapper.mapAllGameEntitiesToDomains(input: $0) }
            .filter { !$0.isEmpty }
            .ifEmpty(switchTo: self.remote.getAllGames()
                        .map { GameMapper.mapAllGameResponsesToEntities(input: $0) }
                        .flatMap { self.locale.addAllGames(from: $0) }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getAllGames()
                            .map { GameMapper.mapAllGameEntitiesToDomains(input: $0) }
                        }
            )
    }
    
    func getLatestGames() -> Observable<[GameModel]> {
        return self.locale.getLatestGames()
            .map { GameMapper.mapLatestGameEntitiesToDomains(input: $0) }
            .filter { !$0.isEmpty }
            .ifEmpty(switchTo: self.remote.getLatestGames()
                        .map { GameMapper.mapLatestGameResponsesToEntities(input: $0) }
                        .flatMap { self.locale.addLatestGames(from: $0) }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getLatestGames()
                            .map { GameMapper.mapLatestGameEntitiesToDomains(input: $0) }
                        }
            )
    }
    
    func getFavoriteGames() -> Observable<[GameModel]> {
        return self.locale.getFavoriteGames()
            .map { GameMapper.mapAllGameEntitiesToDomains(input: $0) }
            .filter { !$0.isEmpty }
    }
    
    func addToFavorite(game: GameModel) {
        self.locale.addToFavorite(game: game)
    }
    
}
