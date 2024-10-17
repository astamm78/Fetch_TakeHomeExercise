//
//  NetworkService.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/15/24.
//

import Foundation
import Networking

class NetworkService {
    enum ResponseError: Error {
        case malformedJSON(message: String)
    }
    
    static var service: Networking {
        return Networking(
            baseURL: "https://d3jbb8n5wk0qxi.cloudfront.net",
            configuration: .default
        )
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
