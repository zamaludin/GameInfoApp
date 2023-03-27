//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import Foundation

public struct GameModel: Equatable, Identifiable {
  public var id: Int
  public var name: String
  public var rating: Float
  public var image: String
  public var desc: String
  public var releaseDate: String
  public var isFav: Bool
  
  public init(id: Int, name: String, rating: Float, image: String, desc: String, releaseDate: String, isFav: Bool) {
    self.id = id
    self.name = name
    self.rating = rating
    self.image = image
    self.desc = desc
    self.releaseDate = releaseDate
    self.isFav = isFav
  }
}

