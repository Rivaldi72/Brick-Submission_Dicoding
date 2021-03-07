import Core
import RxSwift

public struct GetAllGamesRepository<
    GameLocaleDataSource: LocaleDataSource,
    RemoteDataSource: DataSource,
    Transformer: Mapper>: Repository

where
    
    GameLocaleDataSource.Response == AllGameEntityModule,
    RemoteDataSource.Response == [GameResponse],
    Transformer.Response == [GameResponse],
    Transformer.Entity == [AllGameEntityModule],
    Transformer.Domain == [GameDomainModel] {
    
    public typealias Request = Any
    public typealias Response = [GameDomainModel]
    
    private let _localeDataSource: GameLocaleDataSource
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    
    public init(
        localeDataSource: GameLocaleDataSource,
        remoteDataSource: RemoteDataSource,
        mapper: Transformer) {
        
        _localeDataSource = localeDataSource
        _remoteDataSource = remoteDataSource
        _mapper = mapper
    }
    
    public func execute(request: Any?) -> Observable<[GameDomainModel]> {
        return _localeDataSource.list(request: nil)
            .map { _mapper.transformEntityToDomain(entity: $0) }
            .filter { !$0.isEmpty }
            .ifEmpty(switchTo: _remoteDataSource.execute(request: nil)
                        .map { _mapper.transformResponseToEntity(response: $0) }
                        .flatMap { _localeDataSource.add(entities: $0) }
                        .filter { $0 }
                        .flatMap { _ in _localeDataSource.list(request: nil)
                            .map { _mapper.transformEntityToDomain(entity: $0) }
                        }
            )
    }
}


public struct GetLatestGamesRepository<
    GameLocaleDataSource: LocaleDataSource,
    RemoteDataSource: DataSource,
    Transformer: Mapper>: Repository

where
    
    GameLocaleDataSource.Response == LatestGameEntityModule,
    RemoteDataSource.Response == [GameResponse],
    Transformer.Response == [GameResponse],
    Transformer.Entity == [LatestGameEntityModule],
    Transformer.Domain == [GameDomainModel] {
    
    public typealias Request = Any
    public typealias Response = [GameDomainModel]
    
    private let _localeDataSource: GameLocaleDataSource
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    
    public init(
        localeDataSource: GameLocaleDataSource,
        remoteDataSource: RemoteDataSource,
        mapper: Transformer) {
        
        _localeDataSource = localeDataSource
        _remoteDataSource = remoteDataSource
        _mapper = mapper
    }
    
    public func execute(request: Any?) -> Observable<[GameDomainModel]> {
        return _localeDataSource.list(request: nil)
            .map { _mapper.transformEntityToDomain(entity: $0) }
            .filter { !$0.isEmpty }
            .ifEmpty(switchTo: _remoteDataSource.execute(request: nil)
                        .map { _mapper.transformResponseToEntity(response: $0) }
                        .flatMap { _localeDataSource.add(entities: $0) }
                        .filter { $0 }
                        .flatMap { _ in _localeDataSource.list(request: nil)
                            .map { _mapper.transformEntityToDomain(entity: $0) }
                        }
            )
    }
}

public struct GetDetailGameRepository<
    GameLocaleDataSource: LocaleDataSource,
    Transformer: Mapper>: Repository

where
    
    GameLocaleDataSource.Response == AllGameEntityModule,
    Transformer.Response == GameResponse,
    Transformer.Entity == AllGameEntityModule,
    Transformer.Domain == GameDomainModel {
    
    public typealias Request = Int
    public typealias Response = GameDomainModel
    
    private let _localeDataSource: GameLocaleDataSource
    private let _mapper: Transformer
    
    public init(
        localeDataSource: GameLocaleDataSource,
        mapper: Transformer) {
        
        _localeDataSource = localeDataSource
        _mapper = mapper
    }
    
    public func execute(request: Int?) -> Observable<GameDomainModel> {
        return _localeDataSource.get(id: request ?? 0)
            .map { _mapper.transformEntityToDomain(entity: $0) }
    }
}

public struct UpdateFavoriteGameRepository<
    GameLocaleDataSource: LocaleDataSource,
    Transformer: Mapper>: Repository

where
    
    GameLocaleDataSource.Response == AllGameEntityModule,
    Transformer.Response == GameResponse,
    Transformer.Entity == AllGameEntityModule,
    Transformer.Domain == GameDomainModel {
    
    public typealias Request = Int
    public typealias Response = Bool
    
    private let _localeDataSource: GameLocaleDataSource
    private let _mapper: Transformer
    
    public init(
        localeDataSource: GameLocaleDataSource,
        mapper: Transformer) {
        
        _localeDataSource = localeDataSource
        _mapper = mapper
    }
    
    public func execute(request: Int?) -> Observable<Bool> {
        return _localeDataSource.addToFavorite(id: request ?? 0)
    }
}


public struct GetFavoriteGamesRepository<
    GameLocaleDataSource: LocaleDataSource,
    Transformer: Mapper>: Repository

where
    
    GameLocaleDataSource.Response == AllGameEntityModule,
    Transformer.Response == [GameResponse],
    Transformer.Entity == [AllGameEntityModule],
    Transformer.Domain == [GameDomainModel] {
    
    public typealias Request = Any
    public typealias Response = [GameDomainModel]
    
    private let _localeDataSource: GameLocaleDataSource
    private let _mapper: Transformer
    
    public init(
        localeDataSource: GameLocaleDataSource,
        mapper: Transformer) {
        
        _localeDataSource = localeDataSource
        _mapper = mapper
    }
    
    public func execute(request: Any?) -> Observable<[GameDomainModel]> {
        return _localeDataSource.list(request: nil)
            .map { _mapper.transformEntityToDomain(entity: $0) }
            .filter { !$0.isEmpty }
    }
}
