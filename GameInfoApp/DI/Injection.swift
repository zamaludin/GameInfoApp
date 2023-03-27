//
//  Injection.swift
//  GameInfoApp
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import Foundation

import GIGame

final class Injection: NSObject {
  
  private let homeInjection = GameInjection()
  private let favInjection = GameInjection()
  
  func provideHome() -> HomeUseCase {
    return homeInjection.provideHome()
  }
  
  func provideFav() -> GameFavouriteUseCase {
    return favInjection.provideFav()
  }
  
}
