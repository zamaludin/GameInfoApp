//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import Foundation
import RealmSwift

public final class GameInjection: NSObject {
  
  private func provideGameRepository() -> GameRepositoryProtocol {
    let realm = try? Realm()
    let local: GameLocalDataSource = GameLocalDataSource.shared(realm)
    let remote: GameDataSource = GameDataSource.shared
    return GameRepository.shared(remote, local)
  }
  
  public func provideHome() -> HomeUseCase {
    let repository = provideGameRepository()
    return HomeInteractor(repository: repository)
  }
  
  public func provideFav() -> GameFavouriteUseCase {
    let repository = provideGameRepository()
    return GameFavouriteInteractor(repository: repository)
  }
}
