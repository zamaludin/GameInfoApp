//
//  SwiftUIView.swift
//  
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import SwiftUI

public struct HomeView: View {
  
  @EnvironmentObject var presenter: HomePresenter
  
  public init() {}
  
  public var body: some View {
    NavigationView {
      ZStack {
        if presenter.isLoading {
          VStack {
            Text("Loading...")
  //          ActivityIndicator()
          }
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            ForEach(
              self.presenter.games,
              id: \.id
            ) { game in
              ZStack {
                self.presenter.navigationLinkBuilder(game: game) {
                  GameRow(game: game)
                }.buttonStyle(PlainButtonStyle())
              }.padding(8)
            }
          }
        }
      }.onAppear {
        if presenter.games.isEmpty && !presenter.isError {
          self.presenter.fetchGames()
        }
      }.navigationBarTitle(
        Text("Game Info Apps"),
        displayMode: .automatic
      )
    }
    
//    .toolbar {
//      self.presenter.linkFav {
//        Text("List Fav")
//      }
//      
//      self.presenter.linkAbout {
//        Text("About Me")
//      }
//    }
  }
}
