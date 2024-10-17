//
//  Recipe.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/15/24.
//

import Foundation

struct Recipe: Identifiable, Codable, Previewable {
    typealias PreviewType = Recipe
    
    var id: String { uuid }
    
    var uuid: String
    var name: String
    var cuisine: String
    
    var photoURLLarge: URL?
    var photoURLSmall: URL?
    var sourceURL: URL?
    var youtubeURL: URL?
    
    internal enum CodingKeys: String, CodingKey, CaseIterable {
        case cuisine, name, uuid
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        uuid = try container.decode(String.self, forKey: .uuid)
        name = try container.decode(String.self, forKey: .name)
        cuisine = try container.decode(String.self, forKey: .cuisine)
        
        photoURLLarge = try? container.decodeIfPresent(URL.self, forKey: .photoURLLarge)
        photoURLSmall = try? container.decodeIfPresent(URL.self, forKey: .photoURLSmall)
        sourceURL = try? container.decodeIfPresent(URL.self, forKey: .sourceURL)
        youtubeURL = try? container.decodeIfPresent(URL.self, forKey: .youtubeURL)
    }
}


typealias RecipeCollection = [Recipe]

struct RecipesNetworkResponse: Codable, Previewable {
    typealias PreviewType = RecipesNetworkResponse
    
    var recipes: RecipeCollection
}
