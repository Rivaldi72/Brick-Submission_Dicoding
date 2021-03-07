//
//  Injection.swift
//  Brick
//
//  Created by Rivaldi Aliando on 28/11/20.
//

import Foundation
import RealmSwift
import Core
import Game
import UIKit

final class Injection: NSObject {
    
    func provideAllGame<U: UseCase>() -> U where U.Request == Any, U.Response == [GameDomainModel] {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let locale = GetAllGamesLocale(realm: appDelegate.realm)
        let remote = GetGamesRemoteDataSource(endpoint: Endpoints.Gets.all.url)
        let mapper = AllGameTransformer()
        let repository = GetAllGamesRepository(
            localeDataSource: locale,
            remoteDataSource: remote,
            mapper: mapper)

        return Interactor(repository: repository) as! U
    }
    
    func provideLatestGame<U: UseCase>() -> U where U.Request == Any, U.Response == [GameDomainModel] {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let locale = GetLatestGamesLocale(realm: appDelegate.realm)
        let remote = GetGamesRemoteDataSource(endpoint: Endpoints.Gets.latest.url)
        let mapper = LatestGameTransformer()
        let repository = GetLatestGamesRepository(
            localeDataSource: locale,
            remoteDataSource: remote,
            mapper: mapper)

        return Interactor(repository: repository) as! U
    }
    
    func provideFavoriteGame<U: UseCase>() -> U where U.Request == Any, U.Response == [GameDomainModel] {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let locale = GetFavoriteGamesLocale(realm: appDelegate.realm)
        let mapper = AllGameTransformer()
        let repository = GetFavoriteGamesRepository(
            localeDataSource: locale,
            mapper: mapper)

        return Interactor(repository: repository) as! U
    }
    
    func provideDetail<U: UseCase>() -> U where U.Request == Int, U.Response == GameDomainModel {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let locale = GetAllGamesLocale(realm: appDelegate.realm)
        let mapper = DetailGameTransformer()
        
        let repository = GetDetailGameRepository(
            localeDataSource: locale,
            mapper: mapper)

        return Interactor(repository: repository) as! U
    }
    
    func provideUpdateFavorite<U: UseCase>() -> U where U.Request == Int, U.Response == Bool {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let locale = GetAllGamesLocale(realm: appDelegate.realm)
        let mapper = DetailGameTransformer()
        
        let repository = UpdateFavoriteGameRepository(
            localeDataSource: locale,
            mapper: mapper)

        return Interactor(repository: repository) as! U
    }
    
}
