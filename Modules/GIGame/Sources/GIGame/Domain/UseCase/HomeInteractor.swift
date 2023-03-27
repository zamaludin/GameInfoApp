//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import Foundation
import Combine

public protocol HomeUseCase {
  func getGames() -> AnyPublisher<[GameModel], Error>
}

public class HomeInteractor: HomeUseCase {
  private let repository: GameRepositoryProtocol
  
  public required init(repository: GameRepositoryProtocol) {
    self.repository = repository
  }
  
  public func getGames() -> AnyPublisher<[GameModel], Error> {
    return repository.getGames()
  }
}
