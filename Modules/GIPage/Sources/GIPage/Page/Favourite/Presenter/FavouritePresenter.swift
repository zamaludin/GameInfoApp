//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 27/03/23.
//

import SwiftUI
import Combine

import GICommon
import GIGame

public class FavouritePresenter: ObservableObject {
  private var cancellables: Set<AnyCancellable> = []
  private let router = Router()
  private let favUseCase: GameFavouriteUseCase
  
  @Published var games: [GameModel] = []
  
  @Published var isLoading: Bool = false
  @Published var isError: Bool = false
  @Published var error: Error = EmptyError.empty
  
  public init(favUseCase: GameFavouriteUseCase) {
    self.favUseCase = favUseCase
  }
  
  public func fetchGamesFav() {
    self.isError = false
    self.error = EmptyError.empty
    
    favUseCase.getGamesFav()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.isError = true
          self.error = error
        case .finished:
          self.isLoading = false
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
