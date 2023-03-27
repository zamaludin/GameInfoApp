//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 26/03/23.
//

import Foundation
import GIGame
import RealmSwift

public final class GameDetailInjection: NSObject {
  private func provideMovieDetailRepository() -> GameRepositoryProtocol {
    let remote: GameDataSource = GameDataSource.shared
    let realm = try? Realm()
    let local: GameLocalDataSource = GameLocalDataSource.shared(realm)
    return GameRepository.shared(remote, local)
  }
  
  public func provideDetail() -> GameDetailUseCase {
    let repository = provideMovieDetailRepository()
    return GameDetailInteractor(repository: repository)
  }
}
