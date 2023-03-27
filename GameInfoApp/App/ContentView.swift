//
//  ContentView.swift
//  GameInfoApp
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import SwiftUI

import GIPage
import GIAbout

struct ContentView: View {
  @EnvironmentObject var homePresenter: HomePresenter
  
  var body: some View {
    TabView() {
      HomeView().tabItem {
        Image(systemName: "house.fill" )
        Text("HOME")
      }
      
      FavouriteView().tabItem {
        Image(systemName: "heart.fill" )
        Text("FAVOURITE")
      }
      
      AboutView().tabItem {
        Image(systemName: "person.circle.fill")
        Text("ABOUT")
      }
    }
  }
}
