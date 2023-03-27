//
//  SwiftUIView.swift
//  
//
//  Created by Zamaludin Abdulah on 27/03/23.
//

import SwiftUI

public struct AboutView: View {
  public init() {}
  public var body: some View {
    VStack {
      Image("img-muka").resizable().frame(width: 100, height: 100, alignment: .center)
      Text("Nama : Zamaludin Abdulah")
      Text("Email: zamaludin@live.com")
      Text("Api: rawg.com")
    }
  }
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}
