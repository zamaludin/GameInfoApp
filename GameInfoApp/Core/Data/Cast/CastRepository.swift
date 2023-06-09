//
//  CastRepository.swift
//  GameInfoApp
//
//  Created by Andika on 28/10/21.
//

import Foundation
import Combine

protocol CastRepositoryProtocol {
    func getCast(movieId: Int) -> AnyPublisher<[CastModel], Error>
}

final class CastRepository: NSObject {
    typealias CastInstance = (CastDataSource) -> CastRepository

    fileprivate let remote: CastDataSource

    private init(remote: CastDataSource) {
        self.remote = remote
    }

    static let sharedInstance: CastInstance = { remoteRepo in
        return CastRepository(remote: remoteRepo)
    }
}

extension CastRepository: CastRepositoryProtocol {
    func getCast(movieId: Int) -> AnyPublisher<[CastModel], Error> {
        return self.remote.getCast(movieId: movieId)
            .map { CastMapper.mapCastResponsesToDomains(input: $0) }
                    .eraseToAnyPublisher()
    }
}
