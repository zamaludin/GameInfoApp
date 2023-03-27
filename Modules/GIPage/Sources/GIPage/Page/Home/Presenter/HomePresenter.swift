//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 25/03/23.
//


import SwiftUI
import Combine

import GICommon
import GIGame

public class HomePresenter: ObservableObject {
  private var cancellables: Set<AnyCancellable> = []
  private let router = Router()
  private let homeUseCase: HomeUseCase
  
  @Published var games: [GameModel] = []
  
  @Published var isLoading: Bool = false
  @Published var isError: Bool = false
  @Published var error: Error = EmptyError.empty
  
  public init(homeUseCase: HomeUseCase) {
    self.homeUseCase = homeUseCase
  }
  
  public func fetchGames(skipLoadingBehaviour: Bool = false) {
    
    if !skipLoadingBehaviour {
      self.isLoading = true
    }
    
    self.isError = false
    self.error = EmptyError.empty
    
    homeUseCase.getGames()
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
      }, receiveValue: { games in
          self.games = games
      }).store(in: &cancellables)
  }
  
  func navigationLinkBuilder<Content: View>(game: GameModel,
                                            @ViewBuilder content: () -> Content) -> some View {
    NavigationLink(destination: router.makeDetailView(game: game)) {
      content()
    }.buttonStyle(PlainButtonStyle())
  }
}
