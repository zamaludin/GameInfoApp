//
//  GameInfoAppApp.swift
//  GameInfoApp
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import SwiftUI
import GIPage

@main
struct GameInfoAppApp: App {
  var body: some Scene {
    let injection = Injection.init()
    let homePresenter = HomePresenter(homeUseCase: injection.provideHome())
    let favouritePresenter = FavouritePresenter(favUseCase: injection.provideFav())
    
    
    WindowGroup {
      ContentView()
        .environmentObject(homePresenter)
        .environmentObject(favouritePresenter)
    }
  }
}
