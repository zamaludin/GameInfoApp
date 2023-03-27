//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import Foundation
final class GameMapper {
  static func mapGameResponsesToDomains(input gameResponse: GamesResponse) -> [GameModel] {
    return gameResponse.results.map { result in
      return GameModel(id: result.id,
                       name: result.name,
                       rating: Float(result.rating),
                       image: result.backgroundImage,
                       desc: "",
                       releaseDate: result.released,
                       isFav: false)
      
    }
  }
  
  static func mapGameDetailResponseToDomain(input result: GameDetailResponse) -> GameModel {
    return GameModel(id: result.id,
                     name: result.name,
                     rating: Float(result.rating),
                     image: result.backgroundImage,
                     desc: result.description,
                     releaseDate: result.released,
                     isFav: false)
  }
  
  public static func mapGameToEntity(input game: GameModel) -> GameEntity {
    let result = game
    let newGame = GameEntity()
    newGame.id = result.id
    newGame.title = result.name
    newGame.rating = result.rating
    newGame.image = result.image
    newGame.releaseDate = result.releaseDate
    return newGame
  }
  
  static func mapGameEntitiesToDomains(
    input gameEntities: [GameEntity]
  ) -> [GameModel] {
    return gameEntities.map { result in
      return GameModel(id: result.id,
                       name: result.title,
                       rating: result.rating,
                       image: result.image,
                       desc: result.description,
                       releaseDate: result.releaseDate,
                       isFav: false)
    }
  }
}
