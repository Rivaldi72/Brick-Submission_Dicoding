//
//  LocaleDataSource.swift
//  Brick
//
//  Created by Rivaldi Aliando on 07/12/20.
//

import Foundation
import RealmSwift
import RxSwift

protocol LocaleDataSourceProtocol: class {
    
    func getAllGames() -> Observable<[AllGameEntity]>
    func getLatestGames() -> Observable<[LatestGameEntity]>
    
    func addAllGames(from games: [AllGameEntity]) -> Observable<Bool>
    func addLatestGames(from games: [LatestGameEntity]) -> Observable<Bool>
    
}

final class LocaleDataSource: NSObject {
    
    private let realm: Realm?
    private init(realm: Realm?) {
        self.realm = realm
    }
    static let sharedInstance: (Realm?) -> LocaleDataSource = {
        realmDatabase in return LocaleDataSource(realm: realmDatabase)
    }
    
}

extension LocaleDataSource: LocaleDataSourceProtocol {
    
    func getAllGames() -> Observable<[AllGameEntity]> {
        return Observable<[AllGameEntity]>.create { observer in
            if let realm = self.realm {
                let games: Results<AllGameEntity> = {
                    realm.objects(AllGameEntity.self)
                        .sorted(byKeyPath: "released", ascending: true)
                }()
                observer.onNext(games.toArray(ofType: AllGameEntity.self))
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    func getLatestGames() -> Observable<[LatestGameEntity]> {
        return Observable<[LatestGameEntity]>.create { observer in
            if let realm = self.realm {
                let games: Results<LatestGameEntity> = {
                    realm.objects(LatestGameEntity.self)
                        .sorted(byKeyPath: "released", ascending: true)
                }()
                observer.onNext(games.toArray(ofType: LatestGameEntity.self))
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    func getFavoriteGames() -> Observable<[AllGameEntity]> {
        return Observable<[AllGameEntity]>.create { observer in
            if let realm = self.realm {
                let games: Results<AllGameEntity> = {
                    realm.objects(AllGameEntity.self)
                        .filter("isFavorite == %@", true)
                        .sorted(byKeyPath: "released", ascending: true)
                }()
                observer.onNext(games.toArray(ofType: AllGameEntity.self))
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    func addAllGames(from games: [AllGameEntity]) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for game in games {
                            realm.add(game, update: .all)
                        }
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(DatabaseError.requestFailed)
                }
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    func addLatestGames(from games: [LatestGameEntity]) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for game in games {
                            realm.add(game, update: .all)
                        }
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(DatabaseError.requestFailed)
                }
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
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

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
    
}
