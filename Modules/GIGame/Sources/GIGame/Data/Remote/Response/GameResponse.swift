//
//  File.swift
//  
//
//  Created by Zamaludin Abdulah on 25/03/23.
//

import Foundation

// MARK: - GamesResponse
public struct GamesResponse: Codable {
    let count: Int
    let next: String
    let results: [GamesResponseResult]
    let seoTitle, seoDescription, seoKeywords, seoH1: String
    let noindex, nofollow: Bool
    let description: String
    let filters: GamesResponseFilters
    let nofollowCollections: [String]

    enum CodingKeys: String, CodingKey {
        case count, next, results
        case seoTitle = "seo_title"
        case seoDescription = "seo_description"
        case seoKeywords = "seo_keywords"
        case seoH1 = "seo_h1"
        case noindex, nofollow, description, filters
        case nofollowCollections = "nofollow_collections"
    }
}

// MARK: - GamesResponseFilters
public struct GamesResponseFilters: Codable {
    let years: [GamesResponseFiltersYear]
}

// MARK: - GamesResponseFiltersYear
public struct GamesResponseFiltersYear: Codable {
    let from, to: Int
    let filter: String
    let decade: Int
    let years: [GamesResponseYearYear]
    let nofollow: Bool
    let count: Int
}

// MARK: - GamesResponseYearYear
public struct GamesResponseYearYear: Codable {
    let year, count: Int
    let nofollow: Bool
}

// MARK: - GamesResponseResult
public struct GamesResponseResult: Codable {
    let id: Int
    let slug, name, released: String
    let tba: Bool
    let backgroundImage: String
    let rating: Double
    let ratingTop: Int
    let ratings: [GamesResponseRating]
    let ratingsCount, reviewsTextCount, added: Int
    let addedByStatus: GamesResponseAddedByStatus
    let metacritic, playtime, suggestionsCount: Int
    let updated: String
    let reviewsCount: Int
    let saturatedColor, dominantColor: String
    let platforms: [GamesResponsePlatformElement]?
    let parentPlatforms: [GamesResponseParentPlatform]
    let genres: [GamesResponseGenre]
    let stores: [GamesResponseStore]
    let clip: String?
    let tags: [GamesResponseGenre]
    let esrbRating: GamesResponseEsrbRating
    let shortScreenshots: [GamesResponseShortScreenshot]

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released, tba
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case ratings
        case ratingsCount = "ratings_count"
        case reviewsTextCount = "reviews_text_count"
        case added
        case addedByStatus = "added_by_status"
        case metacritic, playtime
        case suggestionsCount = "suggestions_count"
        case updated
        
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case platforms
        case parentPlatforms = "parent_platforms"
        case genres, stores, clip, tags
        case esrbRating = "esrb_rating"
        case shortScreenshots = "short_screenshots"
    }
}

// MARK: - GamesResponseAddedByStatus
public struct GamesResponseAddedByStatus: Codable {
    let yet, owned, beaten, toplay: Int
    let dropped, playing: Int
}

// MARK: - GamesResponseEsrbRating
public struct GamesResponseEsrbRating: Codable {
    let id: Int
    let name, slug: String
}

// MARK: - GamesResponseGenre
public struct GamesResponseGenre: Codable {
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

// MARK: - GamesResponseParentPlatform
public struct GamesResponseParentPlatform: Codable {
    let platform: GamesResponseEsrbRating
}

// MARK: - GamesResponsePlatformElement
public struct GamesResponsePlatformElement: Codable {
    let platform: GamesResponsePlatformPlatform
    let releasedAt: String?
  
    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
    }
}

// MARK: - GamesResponsePlatformPlatform
public struct GamesResponsePlatformPlatform: Codable {
    let id: Int
    let name, slug: String
    let yearEnd: String?
    let yearStart, gamesCount: Int?
    let imageBackground: String

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case yearEnd = "year_end"
        case yearStart = "year_start"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}

// MARK: - GamesResponseRating
public struct GamesResponseRating: Codable {
    let id: Int
    let title: String
    let count: Int
    let percent: Double
}

// MARK: - GamesResponseShortScreenshot
public struct GamesResponseShortScreenshot: Codable {
    let id: Int
    let image: String
}

// MARK: - GamesResponseStore
public struct GamesResponseStore: Codable {
    let id: Int
    let store: GamesResponseGenre
}
