//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import SwiftUI
import GIGame
import GIGameDetail

public class Router {
  public func makeDetailView(game: GameModel, showShareToolbar: Bool = true) -> some View {
    let detailUseCase = GameDetailInjection.init().provideDetail()
    
    let presenter = GameDetailPresenter(gameDetailUseCase: detailUseCase, model: game )
    
    return GameDetailView(presenter: presenter)
  }
  
}
