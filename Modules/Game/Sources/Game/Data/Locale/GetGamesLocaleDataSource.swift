import Core
import Foundation
import RxSwift
import RealmSwift

public struct GetAllGamesLocale: LocaleDataSource {
    
    public typealias Request = Any
    public typealias Response = AllGameEntityModule
    
    private let _realm: Realm?
    
    public init(realm: Realm?) {
        _realm = realm
    }
    
    public func list(request: Any?) -> Observable<[AllGameEntityModule]> {
        return Observable<[AllGameEntityModule]>.create { observer in
            if let realm = _realm {
                let games: Results<AllGameEntityModule> = {
                    realm.objects(AllGameEntityModule.self)
                        .sorted(byKeyPath: "released", ascending: true)
                }()
                observer.onNext(games.toArray(ofType: AllGameEntityModule.self))
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    public func add(entities games: [AllGameEntityModule]) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = _realm {
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
    
    public func get(id: Int) -> Observable<AllGameEntityModule> {
        return Observable<AllGameEntityModule>.create { observer in
            if let realm = _realm {
                let games: Results<AllGameEntityModule> = {
                    realm.objects(AllGameEntityModule.self)
                        .filter("id == %d", id)
                        .sorted(byKeyPath: "released", ascending: true)
                }()
                observer.onNext(games.first!)
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    public func update(id: Int, entity: AllGameEntityModule) -> Observable<Bool> {
        fatalError()
    }
    
    public func addToFavorite(id: Int) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            let config = Realm.Configuration(schemaVersion: 1)
            do {
                let realm = try Realm(configuration: config)
                let games = realm.objects(AllGameEntityModule.self).filter("id == \(id)")
                
                for game in games {
                    try realm.write {
                        game.isFavorite = !game.isFavorite
                        realm.add(game)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
            return Disposables.create()
        }
    }
}

public struct GetLatestGamesLocale: LocaleDataSource {
    
    public typealias Request = Any
    public typealias Response = LatestGameEntityModule
    
    private let _realm: Realm?
    
    public init(realm: Realm?) {
        _realm = realm
    }
    
    public func list(request: Any?) -> Observable<[LatestGameEntityModule]> {
        return Observable<[LatestGameEntityModule]>.create { observer in
            if let realm = _realm {
                let games: Results<LatestGameEntityModule> = {
                    realm.objects(LatestGameEntityModule.self)
                        .sorted(byKeyPath: "released", ascending: true)
                }()
                observer.onNext(games.toArray(ofType: LatestGameEntityModule.self))
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    public func add(entities games: [LatestGameEntityModule]) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = _realm {
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
    
    public func get(id: Int) -> Observable<LatestGameEntityModule> {
        fatalError()
    }
    
    public func update(id: Int, entity: LatestGameEntityModule) -> Observable<Bool> {
        fatalError()
    }
    
    public func addToFavorite(id: Int) -> Observable<Bool> {
        fatalError()
    }
}

public struct GetFavoriteGamesLocale: LocaleDataSource {
    
    public typealias Request = Any
    public typealias Response = AllGameEntityModule
    
    private let _realm: Realm?
    
    public init(realm: Realm?) {
        _realm = realm
    }
    
    public func list(request: Any?) -> Observable<[AllGameEntityModule]> {
        return Observable<[AllGameEntityModule]>.create { observer in
            if let realm = _realm {
                let games: Results<AllGameEntityModule> = {
                    realm.objects(AllGameEntityModule.self)
                        .filter("isFavorite == %@", true)
                        .sorted(byKeyPath: "released", ascending: true)
                }()
                observer.onNext(games.toArray(ofType: AllGameEntityModule.self))
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    public func add(entities: [AllGameEntityModule]) -> Observable<Bool> {
        fatalError()
    }
    
    public func get(id: Int) -> Observable<AllGameEntityModule> {
        fatalError()
    }
    
    public func update(id: Int, entity: AllGameEntityModule) -> Observable<Bool> {
        fatalError()
    }
    
    public func addToFavorite(id: Int) -> Observable<Bool> {
        fatalError()
    }
}

public struct GetDetailGameLocale: LocaleDataSource {
    
    public typealias Request = Any
    public typealias Response = AllGameEntityModule
    
    private let _realm: Realm?
    
    public init(realm: Realm?) {
        _realm = realm
    }
    
    public func list(request: Any?) -> Observable<[AllGameEntityModule]> {
        fatalError()
    }
    
    public func add(entities: [AllGameEntityModule]) -> Observable<Bool> {
        fatalError()
    }
    
    public func get(id: Int) -> Observable<AllGameEntityModule> {
        return Observable<AllGameEntityModule>.create { observer in
            if let realm = _realm {
                let games: Results<AllGameEntityModule> = {
                    realm.objects(AllGameEntityModule.self)
                        .filter("id == %d", id)
                        .sorted(byKeyPath: "released", ascending: true)
                }()
                observer.onNext(games.first!)
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
    public func update(id: Int, entity: AllGameEntityModule) -> Observable<Bool> {
        fatalError()
    }
    
    public func addToFavorite(id: Int) -> Observable<Bool> {
        fatalError()
    }
}
