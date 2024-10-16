//
//  RecipeNetwork.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/15/24.
//

import Foundation
import Networking

struct RecipeNetwork {
    enum Endpoint {
        static var allRecipes = "/recipes.json"
        static var malformedJSON = "/recipes-malformed.json"
        static var emptyResponse = "/recipes-empty.json"
    }
    
    enum ResponseError: Error {
        case malformedJSON(message: String)
    }
    
    static var service: Networking {
        return Networking(
            baseURL: "https://d3jbb8n5wk0qxi.cloudfront.net",
            configuration: .default
        )
    }
    
    static func allRecipes(for endpoint: String) async throws -> RecipesNetworkResponse {
        let response = try await RecipeNetwork.service.get(endpoint)
        
        let recipesResponse: RecipesNetworkResponse = try handleResponse(response)
        return recipesResponse
    }
    
    static func handleResponse<T: Codable>(_ response: JSONResult) throws -> T {
        switch response {
        case .success(let successJSONResponse):
            let data = successJSONResponse.data
            do {
                let responseObject: T = try JSONDecoder().decode(T.self, from: data)
                return responseObject
            } catch {
                throw ResponseError.malformedJSON(message: String(describing: error))
            }
        case .failure(let failureJSONResponse):
            throw ResponseError.malformedJSON(message: String(describing: failureJSONResponse.error))
        }
    }
    
}
