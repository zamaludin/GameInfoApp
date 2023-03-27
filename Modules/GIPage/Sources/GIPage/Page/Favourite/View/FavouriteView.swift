//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 27/03/23.
//

import SwiftUI
import GIGame
import GICommon

public struct FavouriteView: View {
  
  @EnvironmentObject var presenter: FavouritePresenter
  
  public init() {}
  
  public var body: some View {
    NavigationView {
      ZStack {
        if presenter.isLoading {
          VStack {
            Text("Loading...")
          }
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            if self.presenter.games.isEmpty {
              Text("Favourite is Empty")
            } else {
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
        }
      }.onAppear {
        self.presenter.fetchGamesFav()
      }.navigationBarTitle(
        Text("List Fav"),
        displayMode: .automatic
      )
    }
    
  }
}

