//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 27/03/23.
//

import Foundation
import Combine

public protocol GameFavouriteUseCase {
  func getGamesFav() -> AnyPublisher<[GameModel], Error>
}

public class GameFavouriteInteractor: GameFavouriteUseCase {
  private let repository: GameRepositoryProtocol
  
  public required init(repository: GameRepositoryProtocol) {
    self.repository = repository
  }
  
  public func getGamesFav() -> AnyPublisher<[GameModel], Error> {
    return repository.getGamesFav()
  }
}
