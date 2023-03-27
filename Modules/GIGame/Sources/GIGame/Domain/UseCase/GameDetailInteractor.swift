//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 26/03/23.
//

import Foundation
import Combine

public protocol GameDetailUseCase {
  func getGameDetail(id: Int) -> AnyPublisher<GameModel, Error>
  func addGameToFav(game: GameModel) -> AnyPublisher<Bool, Error>
  func isGameFav(game: GameModel) -> AnyPublisher<Bool, Error>
  func removeGameFav(game: GameModel) -> AnyPublisher<Bool, Error>
}

public class GameDetailInteractor: GameDetailUseCase {
  private let repository: GameRepositoryProtocol
  
  public required init(repository: GameRepositoryProtocol) {
    self.repository = repository
  }
  
  public func getGameDetail(id: Int) -> AnyPublisher<GameModel, Error> {
    return repository.getGameDetail(id: id)
  }
  
  public func addGameToFav(game: GameModel) -> AnyPublisher<Bool, Error> {
    return repository.addGameToFav(game: game)
  }
  
  public func isGameFav(game: GameModel) -> AnyPublisher<Bool, Error> {
    return repository.isGameFav(game: game)
  }
  
  public func removeGameFav(game: GameModel) -> AnyPublisher<Bool, Error> {
    return repository.removeGameFav(game: game)
  }
}
