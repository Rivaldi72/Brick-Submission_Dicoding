//
//  GameMapper.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

final class GameMapper {

  static func mapGameResponsesToDomains(
    input gameResponses: [GameResponse]
  ) -> [GameModel] {

    return gameResponses.map { result in
      return GameModel(
        id: result.id ?? 0,
        name: result.name ?? "Unknown",
        released: result.released ?? "Unknown",
        backgroundImage: result.backgroundImage ?? "Unknown",
        rating: result.rating ?? 0.0,
        ratingTop: result.ratingTop ?? 0,
        show: false,
        isFavorite: false
      )
    }
  }
  
  static func mapAllGameResponsesToEntities(
    input allGameResponses: [GameResponse]
  ) -> [AllGameEntity] {
    return allGameResponses.map { result in
      let newAllGame = AllGameEntity()
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
  
  static func mapLatestGameResponsesToEntities(
    input latestGameResponses: [GameResponse]
  ) -> [LatestGameEntity] {
    return latestGameResponses.map { result in
      let newLatestGame = LatestGameEntity()
      newLatestGame.id = result.id ?? 0
      newLatestGame.name = result.name ?? "Unknow"
      newLatestGame.released = result.released ?? "Unknow"
      newLatestGame.backgroundImage = result.backgroundImage ?? "Unknow"
      newLatestGame.rating = result.rating ?? 0.0
      newLatestGame.ratingTop = result.ratingTop ?? 0
      newLatestGame.show = false
      newLatestGame.isFavorite = false
      return newLatestGame
    }
  }
   
  static func mapAllGameEntitiesToDomains(
    input allGameEntities: [AllGameEntity]
  ) -> [GameModel] {
    return allGameEntities.map { result in
      return GameModel(
        id: result.id,
        name: result.name,
        released: result.released,
        backgroundImage: result.backgroundImage,
        rating: result.rating,
        ratingTop: result.ratingTop,
        show: result.show,
        isFavorite: result.isFavorite
      )
    }
  }
  
  static func mapLatestGameEntitiesToDomains(
    input latestGameEntities: [LatestGameEntity]
  ) -> [GameModel] {
    return latestGameEntities.map { result in
      return GameModel(
        id: result.id,
        name: result.name,
        released: result.released,
        backgroundImage: result.backgroundImage,
        rating: result.rating,
        ratingTop: result.ratingTop,
        show: result.show,
        isFavorite: result.isFavorite
      )
    }
  }

  
}
