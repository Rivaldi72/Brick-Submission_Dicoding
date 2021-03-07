import Core

public struct AllGameTransformer: Mapper {
    public typealias Response = [GameResponse]
    public typealias Entity = [AllGameEntityModule]
    public typealias Domain = [GameDomainModel]
    
    public init() {}
    
    public func transformResponseToEntity(response: [GameResponse]) -> [AllGameEntityModule] {
        return response.map { result in
            let newAllGame = AllGameEntityModule()
            newAllGame.id = result.id ?? 0
            newAllGame.name = result.name ?? "Unknow"
            newAllGame.released = result.released ?? "Unknow"
            newAllGame.backgroundImage = result.backgroundImage ?? "Unknow"
            newAllGame.rating = result.rating ?? 0.0
            newAllGame.ratingTop = result.ratingTop ?? 0
            newAllGame.show = false
            newAllGame.isFavorite = false
            return newAllGame
        }
    }
    
    public func transformEntityToDomain(entity: [AllGameEntityModule]) -> [GameDomainModel] {
        return entity.map { result in
            return GameDomainModel(
                id: result.id,
                name: result.name,
                released: result.released,
                backgroundImage: result.backgroundImage,
                rating: result.rating,
                ratingTop: result.ratingTop,
                show: false,
                isFavorite: false
            )
        }
    }
}

public struct LatestGameTransformer: Mapper {
    public typealias Response = [GameResponse]
    public typealias Entity = [LatestGameEntityModule]
    public typealias Domain = [GameDomainModel]
    
    public init() {}
    
    public func transformResponseToEntity(response: [GameResponse]) -> [LatestGameEntityModule] {
        return response.map { result in
            let newAllGame = LatestGameEntityModule()
            newAllGame.id = result.id ?? 0
            newAllGame.name = result.name ?? "Unknow"
            newAllGame.released = result.released ?? "Unknow"
            newAllGame.backgroundImage = result.backgroundImage ?? "Unknow"
            newAllGame.rating = result.rating ?? 0.0
            newAllGame.ratingTop = result.ratingTop ?? 0
            newAllGame.show = false
            newAllGame.isFavorite = false
            return newAllGame
        }
    }
    
    public func transformEntityToDomain(entity: [LatestGameEntityModule]) -> [GameDomainModel] {
        return entity.map { result in
            return GameDomainModel(
                id: result.id,
                name: result.name,
                released: result.released,
                backgroundImage: result.backgroundImage,
                rating: result.rating,
                ratingTop: result.ratingTop,
                show: false,
                isFavorite: false
            )
        }
    }
}

public struct DetailGameTransformer: Mapper {
    public typealias Response = GameResponse
    public typealias Entity = AllGameEntityModule
    public typealias Domain = GameDomainModel
    
    public init() {}
    
    public func transformResponseToEntity(response: GameResponse) -> AllGameEntityModule {
        let newAllGame = AllGameEntityModule()
        newAllGame.id = response.id ?? 0
        newAllGame.name = response.name ?? "Unknow"
        newAllGame.released = response.released ?? "Unknow"
        newAllGame.backgroundImage = response.backgroundImage ?? "Unknow"
        newAllGame.rating = response.rating ?? 0.0
        newAllGame.ratingTop = response.ratingTop ?? 0
        newAllGame.show = false
        newAllGame.isFavorite = false
        return newAllGame
    }
    
    public func transformEntityToDomain(entity: AllGameEntityModule) -> GameDomainModel {
        return GameDomainModel(
            id: entity.id,
            name: entity.name,
            released: entity.released,
            backgroundImage: entity.backgroundImage,
            rating: entity.rating,
            ratingTop: entity.ratingTop,
            show: false,
            isFavorite: false
        )
    }
}
