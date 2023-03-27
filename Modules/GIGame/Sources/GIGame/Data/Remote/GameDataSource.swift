//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import Foundation
import Alamofire
import Combine

import GIAPI
import GICommon
import RealmSwift

public protocol GameDataSourceProtocol: AnyObject {
  func getGames() -> AnyPublisher<GamesResponse, Error>
  func getGameDetail(id: Int) -> AnyPublisher<GameDetailResponse, Error>
}

public final class GameDataSource: NSObject {
  public static let shared = GameDataSource()
}

extension GameDataSource: GameDataSourceProtocol {
  public func getGames() -> AnyPublisher<GamesResponse, Error> {
    return Future<GamesResponse, Error> { completion in
      if var urlComponent = URLComponents(string: Endpoints.Get.games.url) {
        urlComponent.queryItems = [
          URLQueryItem(name: "key", value: API.apiKey)
        ]
        if let url = urlComponent.url {
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)
          
          AF.request(url)
            .validate()
            .responseDecodable(of: GamesResponse.self, decoder: decoder) { response in
              switch response.result {
              case .success(let response):
                completion(.success(response))
              case .failure(let error):
                if error.isResponseSerializationError {
                  completion(.failure(DataError.decoderError()))
                } else {
                  completion(.failure(
                    NetworkError.requestFail(with: error.responseCode ?? -1))
                  )
                }
              }
            }
        }
      }
    }.eraseToAnyPublisher()
  }
  
  public func getGameDetail(id: Int) -> AnyPublisher<GameDetailResponse, Error> {
    return Future<GameDetailResponse, Error> { completion in
      if var urlComponent = URLComponents(string: Endpoints.Get.gameDetail(id: id).url) {
        urlComponent.queryItems = [
          URLQueryItem(name: "key", value: API.apiKey)
        ]
        if let url = urlComponent.url {
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)
          
          AF.request(url)
            .validate()
            .responseDecodable(of: GameDetailResponse.self, decoder: decoder) { response in
              switch response.result {
              case .success(let response):
                completion(.success(response))
              case .failure(let error):
                if error.isResponseSerializationError {
                  completion(.failure(DataError.decoderError()))
                } else {
                  completion(.failure(
                    NetworkError.requestFail(with: error.responseCode ?? -1))
                  )
                }
              }
            }
        }
      }
    }.eraseToAnyPublisher()
  }
}
