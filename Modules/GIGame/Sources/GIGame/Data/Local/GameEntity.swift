//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 26/03/23.
//

import Foundation
import RealmSwift

public class GameEntity: Object {
 
  @objc dynamic var id: Int = 0
  @objc dynamic var title: String = ""
  @objc dynamic var image: String = ""
  @objc dynamic var rating: Float = 0
  @objc dynamic var releaseDate: String = ""
  @objc dynamic var desc: String = ""
 
  public override static func primaryKey() -> String? {
    return "id"
  }
 
}
