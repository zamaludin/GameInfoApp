//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import SwiftUI
import CachedAsyncImage
import GIGame

struct GameRow: View {
  var game: GameModel
  
  var body: some View {
    ZStack {
      VStack {
        HStack {
          if game.isFav {
            Image(systemName: "heart.fill")
              .resizable()
              .frame(width: 32, height: 32)
              .foregroundColor(.red)
              .padding([.leading, .top], 10)
            Spacer()
          }
        }
        .padding(.bottom, -30)
        imageCategory
        content
      }
    }
    .frame(width: UIScreen.main.bounds.width - 32, height: 250)
    .background(Color.green.opacity(0.3))
    .cornerRadius(30)
  }

}

extension GameRow {
  var imageCategory: some View {
    CachedAsyncImage(url: URL(string: game.image)) { image in
      image.resizable()
    } placeholder: {
      ProgressView()
    }.cornerRadius(30).scaledToFit().frame(width: 200).padding(.top)
  }

  var content: some View {
    VStack(alignment: .center, spacing: 10) {
      Text(game.name)
        .font(.title)
        .bold()

      Text("rating : \(String(format: "%.2f", game.rating))")
        .font(.system(size: 14))
        .lineLimit(2)
    }.padding(
      EdgeInsets(
        top: 0,
        leading: 16,
        bottom: 16,
        trailing: 16
      )
    )
  }

}

struct CategoryRow_Previews: PreviewProvider {

  static var previews: some View {
    let game = GameModel(id: 0, name: "", rating: 0, image: "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg", desc: "", releaseDate: "", isFav: false)
    return GameRow(game: game)
  }

}
