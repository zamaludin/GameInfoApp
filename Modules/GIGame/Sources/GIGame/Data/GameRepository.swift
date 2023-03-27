//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import Foundation
import Combine

public protocol GameRepositoryProtocol {
  func getGames() -> AnyPublisher<[GameModel], Error>
  func getGameDetail(id: Int) -> AnyPublisher<GameModel, Error>
  
  func addGameToFav(game: GameModel) -> AnyPublisher<Bool, Error>
  func getGamesFav() -> AnyPublisher<[GameModel], Error>
  func isGameFav(game: GameModel) -> AnyPublisher<Bool, Error>
  func removeGameFav(game: GameModel) -> AnyPublisher<Bool, Error>
}

public final class GameRepository: NSObject {
  public typealias GameInstance = (GameDataSource, GameLocalDataSource) -> GameRepository
  
  fileprivate let remote: GameDataSource

  fileprivate let local: GameLocalDataSource
  
  private init(remote: GameDataSource, local: GameLocalDataSource) {
    self.remote = remote
    self.local = local
  }
  
  public static let shared: GameInstance = { (remote, local) in
    return GameRepository(remote: remote, local: local)
  }
}

extension GameRepository: GameRepositoryProtocol {
  
  public func getGames() -> AnyPublisher<[GameModel], Error> {
    return self.remote.getGames()
      .map { GameMapper.mapGameResponsesToDomains(input: $0)}
      .eraseToAnyPublisher()
  }
  
  public func getGameDetail(id: Int) -> AnyPublisher<GameModel, Error> {
    return self.remote.getGameDetail(id: id)
      .map {GameMapper.mapGameDetailResponseToDomain(input: $0)}
      .eraseToAnyPublisher()
  }
  
  public func addGameToFav(game: GameModel) -> AnyPublisher<Bool, Error> {
    return self.local.addGameToFav(game: GameMapper.mapGameToEntity(input: game))
  }
  
  public func getGamesFav() -> AnyPublisher<[GameModel], Error> {
    return self.local.getGamesFav()
      .map {GameMapper.mapGameEntitiesToDomains(input: $0)}
      .eraseToAnyPublisher()
  }
  
  public func isGameFav(game: GameModel) -> AnyPublisher<Bool, Error> {
    return self.local.isGameFav(game: GameMapper.mapGameToEntity(input: game))
  }

  public func removeGameFav(game: GameModel) -> AnyPublisher<Bool, Error> {
    return self.local.removeGameFav(game: GameMapper.mapGameToEntity(input: game))
  }
}
