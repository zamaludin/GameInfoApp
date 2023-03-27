//
//  APIEndpoint.swift
//  GameInfoApp
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import Foundation

// swiftlint:disable line_length
public struct API {
  static let baseUrl = "https://api.rawg.io/api"
  public static var apiKey: String {
    guard let filePath = Bundle.module.path(forResource: "rawg-Info", ofType: "plist") else {
      fatalError("Couldn't find file 'rawg-Info.plist'.")
    }
    
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "API_KEY") as? String else {
      fatalError("Couldn't find key 'API_KEY' in 'rawg-Info.plist'.")
    }
    
    if value.starts(with: "_") {
      fatalError("Register for a rawg developer account and get an API key")
    }
    
    return value
  }
}

protocol Endpoint {
  var url: String { get }
}

public enum Endpoints {
  public enum Get: Endpoint {
    case games
    case gameDetail(id: Int)
    
    public var url: String {
      switch self {
      case .games: return "\(API.baseUrl)/games"
      case .gameDetail(let id): return "\(API.baseUrl)/games/\(id)"
      }
    }
  }
}
// swiftlint:enable line_length
