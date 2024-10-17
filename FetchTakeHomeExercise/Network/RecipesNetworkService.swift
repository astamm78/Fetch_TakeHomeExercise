//
//  RecipesNetworkService.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/17/24.
//

import Foundation

enum RecipesEndpoint: String {
    case allRecipes = "/recipes.json"
    case malformedJSON = "/recipes-malformed.json"
    case emptyResponse = "/recipes-empty.json"
}

class RecipesNetworkService: NetworkService {
 
    static func allRecipes(for endpoint: String) async throws -> RecipesNetworkResponse {
        let response = try await service.get(endpoint)
        
        let recipesResponse: RecipesNetworkResponse = try handleResponse(response)
        return recipesResponse
    }
    
}
