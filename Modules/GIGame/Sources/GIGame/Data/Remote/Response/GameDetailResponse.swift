//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 26/03/23.
//

import Foundation

// MARK: - GameDetailResponse
public struct GameDetailResponse: Codable {
    let id: Int
    let slug, name, nameOriginal, description: String
    let metacritic: Int
    let metacriticPlatforms: [GameDetailResponseMetacriticPlatform]
    let released: String
    let tba: Bool
    let updated: String
    let backgroundImage, backgroundImageAdditional: String
    let website: String
    let rating: Double
    let ratingTop: Int
    let ratings: [GameDetailResponseRating]
    let reactions: GameDetailResponseReactions
    let added: Int
    let addedByStatus: GameDetailResponseAddedByStatus
    let playtime, screenshotsCount, moviesCount, creatorsCount: Int
    let achievementsCount, parentAchievementsCount: Int
    let redditURL: String
    let redditName, redditDescription, redditLogo: String
    let redditCount, twitchCount, youtubeCount, reviewsTextCount: Int
    let ratingsCount, suggestionsCount: Int
    let alternativeNames: [String]
    let metacriticURL: String
    let parentsCount, additionsCount, gameSeriesCount: Int
    let userGame: String?
    let reviewsCount: Int
    let saturatedColor, dominantColor: String
    let parentPlatforms: [GameDetailResponseParentPlatform]
    let platforms: [GameDetailResponsePlatformElement]
    let stores: [GameDetailResponseStore]
    let developers, genres, tags, publishers: [GameDetailResponseDeveloper]
    let esrbRating: GameDetailResponseEsrbRating
    let clip, descriptionRaw: String?

    enum CodingKeys: String, CodingKey {
        case id, slug, name
        case nameOriginal = "name_original"
        case description, metacritic
        case metacriticPlatforms = "metacritic_platforms"
        case released, tba, updated
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case website, rating
        case ratingTop = "rating_top"
        case ratings, reactions, added
        case addedByStatus = "added_by_status"
        case playtime
        case screenshotsCount = "screenshots_count"
        case moviesCount = "movies_count"
        case creatorsCount = "creators_count"
        case achievementsCount = "achievements_count"
        case parentAchievementsCount = "parent_achievements_count"
        case redditURL = "reddit_url"
        case redditName = "reddit_name"
        case redditDescription = "reddit_description"
        case redditLogo = "reddit_logo"
        case redditCount = "reddit_count"
        case twitchCount = "twitch_count"
        case youtubeCount = "youtube_count"
        case reviewsTextCount = "reviews_text_count"
        case ratingsCount = "ratings_count"
        case suggestionsCount = "suggestions_count"
        case alternativeNames = "alternative_names"
        case metacriticURL = "metacritic_url"
        case parentsCount = "parents_count"
        case additionsCount = "additions_count"
        case gameSeriesCount = "game_series_count"
        case userGame = "user_game"
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case parentPlatforms = "parent_platforms"
        case platforms, stores, developers, genres, tags, publishers
        case esrbRating = "esrb_rating"
        case clip
        case descriptionRaw = "description_raw"
    }
}

// MARK: - GameDetailResponseAddedByStatus
public struct GameDetailResponseAddedByStatus: Codable {
    let yet, owned, beaten, toplay: Int
    let dropped, playing: Int
}

// MARK: - GameDetailResponseDeveloper
public struct GameDetailResponseDeveloper: Codable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String
    let domain, language: String?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain, language
    }
}

// MARK: - GameDetailResponseEsrbRating
public struct GameDetailResponseEsrbRating: Codable {
    let id: Int
    let name, slug: String
}

// MARK: - GameDetailResponseMetacriticPlatform
public struct GameDetailResponseMetacriticPlatform: Codable {
    let metascore: Int
    let url: String
    let platform: GameDetailResponseMetacriticPlatformPlatform
}

// MARK: - GameDetailResponseMetacriticPlatformPlatform
public struct GameDetailResponseMetacriticPlatformPlatform: Codable {
    let platform: Int
    let name, slug: String
}

// MARK: - GameDetailResponseParentPlatform
public struct GameDetailResponseParentPlatform: Codable {
    let platform: GameDetailResponseEsrbRating
}

// MARK: - GameDetailResponsePlatformElement
public struct GameDetailResponsePlatformElement: Codable {
    let platform: GameDetailResponsePlatformPlatform
    let releasedAt: String?
    let requirements: GameDetailResponseRequirements

    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
        case requirements
    }
}

// MARK: - GameDetailResponsePlatformPlatform
public struct GameDetailResponsePlatformPlatform: Codable {
    let id: Int
    let name, slug, image, yearEnd: String?
    let yearStart, gamesCount: Int?
    let imageBackground: String

    enum CodingKeys: String, CodingKey {
        case id, name, slug, image
        case yearEnd = "year_end"
        case yearStart = "year_start"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}

// MARK: - GameDetailResponseRequirements
public struct GameDetailResponseRequirements: Codable {
}

// MARK: - GameDetailResponseRating
public struct GameDetailResponseRating: Codable {
    let id: Int
    let title: String
    let count: Int
    let percent: Double
}

// MARK: - GameDetailResponseReactions
public struct GameDetailResponseReactions: Codable {
    let the1: Int

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
    }
}

// MARK: - GameDetailResponseStore
public struct GameDetailResponseStore: Codable {
    let id: Int
    let url: String
    let store: GameDetailResponseDeveloper
}
