//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 26/03/23.
//

import Foundation
import Combine
import GICommon
import GIGame

public class GameDetailPresenter: ObservableObject {
  private var cancellables: Set<AnyCancellable> = []
  private let gameDetailUseCase: GameDetailUseCase
  
  @Published var game: GameModel
  @Published var isLoading: Bool = false
  @Published var isError: Bool = false
  @Published var error: Error = EmptyError.empty
  
  public init(gameDetailUseCase: GameDetailUseCase, model: GameModel) {
    self.gameDetailUseCase = gameDetailUseCase
    self.game = model
  }
  
  public func fetchGame(skipLoadingBehaviour: Bool = false) {
    
    if !skipLoadingBehaviour {
      self.isLoading = true
    }
    
    self.isError = false
    self.error = EmptyError.empty
    
    gameDetailUseCase.getGameDetail(id: self.game.id)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.isError = true
          
          if !skipLoadingBehaviour {
            self.isLoading = false
          }
          
          self.error = error
        case .finished:
          
          if !skipLoadingBehaviour {
            self.isLoading = false
          }
        }
      }, receiveValue: { game in
        self.game = game
        self.isGameFav()
      }).store(in: &cancellables)
  }
  
  func addGameFav() {
    self.isError = false
    self.error = EmptyError.empty
    
    if self.game.isFav {
      self.removeGameFav()
    } else {
      gameDetailUseCase.addGameToFav(game: self.game)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
          switch completion {
          case .failure(let error):
            self.isError = true
            self.error = error
          case .finished:
            debugPrint("Task finished")
          }
        }, receiveValue: { status in
          self.game.isFav = status
        }).store(in: &cancellables)
    }
  }
  
  func removeGameFav() {
    self.isError = false
    self.error = EmptyError.empty
    
    gameDetailUseCase.removeGameFav(game: self.game)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.isError = true
          self.error = error
        case .finished:
          debugPrint("Task finished")
        }
      }, receiveValue: { status in
        self.game.isFav = !status
      }).store(in: &cancellables)
  }
  
  func isGameFav() {
    gameDetailUseCase.isGameFav(game: self.game)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.isError = true
          self.error = error
        case .finished:
          debugPrint("Task finished")
        }
      }, receiveValue: { status in
        self.game.isFav = status
      }).store(in: &cancellables)
  }
}
