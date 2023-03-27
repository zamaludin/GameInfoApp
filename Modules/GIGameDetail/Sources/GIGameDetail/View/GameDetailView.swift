//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 26/03/23.
//

import SwiftUI
import CachedAsyncImage
import RichText
import GIGame
import GICommon

public struct GameDetailView: View {
  @ObservedObject var presenter: GameDetailPresenter
  public init(presenter: GameDetailPresenter) {
    self.presenter = presenter
  }
  public var body: some View {
    ZStack {
      if presenter.isLoading {
        loadingIndicator
      } else {
        ScrollView(.vertical) {
          VStack {
            imageCategory
            btnLove
            spacer
            content
            spacer
          }.padding()
        }
      }
    }
    .navigationBarTitle(Text(self.presenter.game.name), displayMode: .large)
    .onAppear {
      self.presenter.fetchGame()
    }
  }
}

extension GameDetailView {
  var btnLove: some View {
    HStack( spacing: 0) {
      Button {
        self.presenter.addGameFav()
      } label: {
        Image(systemName: self.presenter.game.isFav ? "heart.fill" : "heart")
          .resizable()
          .frame(width: 32, height: 32)
          .foregroundColor(.red)
      }
      spacer
    }
  }
  var spacer: some View {
    Spacer()
  }
  
  var loadingIndicator: some View {
    VStack {
      Text("Loading...")
      //      ActivityIndicator()
    }
  }
  
  var imageCategory: some View {
    CachedAsyncImage(url: URL(string: self.presenter.game.image)) { image in
      image.resizable()
    } placeholder: {
      ProgressView()
    }.scaledToFit().frame(width: 250.0, height: 250.0, alignment: .center)
  }
  
  var description: some View {
    return RichText(html: self.presenter.game.desc)
      .placeholder {
        Text("loading")
      }
  }
  
  func headerTitle(_ title: String) -> some View {
    return Text(title)
      .font(.headline)
  }
  
  var content: some View {
    VStack(alignment: .leading, spacing: 0) {
      headerTitle("Relase : \(self.presenter.game.releaseDate.toDateFormated())")
      headerTitle("Rating : \(String(format: "%.2f",self.presenter.game.rating))")
      headerTitle("Description")
        .padding([.top, .bottom])
      
      description
    }
  }
}
