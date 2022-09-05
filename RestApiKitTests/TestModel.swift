//
//  TestModel.swift
//  RestApiKitTests
//
//  Created by Rashid Mustafa on 05/09/2022.
//

import Foundation

// MARK: - Empty
struct TVShowModel: Codable {
    var page: Int?
    var results: [Result]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    var backdropPath, firstAirDate: String?
    var genreIDS: [Int]?
    var id: Int?
    var name: String?
    var originCountry: [String]?
    var originalLanguage, originalName, overview: String?
    var popularity: Double?
    var posterPath: String?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id, name
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
