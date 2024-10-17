//
//  RecipesNetworkService_XCTests.swift
//  FetchTakeHomeExerciseTests
//
//  Created by Andrew Stamm on 10/17/24.
//

import XCTest
@testable import FetchTakeHomeExercise

final class RecipesNetworkService_XCTests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testAllRecipes_returnsRecipesResponse() async throws {
        let response = try? await RecipesNetworkService.allRecipes(for: RecipesEndpoint.allRecipes.rawValue)
        
        XCTAssertNotNil(response)
    }
    
    func testAllRecipes_returnsRecipesResponseForWhenRecipesIsEmpty() async throws {
        let response = try? await RecipesNetworkService.allRecipes(for: RecipesEndpoint.emptyResponse.rawValue)
        
        XCTAssertNotNil(response)
        XCTAssertTrue(response!.recipes.isEmpty)
    }
    
    func testAllRecipes_throwsErrorForMalformedJSON() async throws {
        do {
            _ = try await RecipesNetworkService.allRecipes(for: RecipesEndpoint.malformedJSON.rawValue)
            XCTFail("Expected an error to be thrown, but no error was thrown.")
        } catch let error as NetworkService.ResponseError {
            switch error {
            case .malformedJSON(let message):
                XCTAssertNotNil(message)
            }
        } catch {
            XCTFail("Unexpected error thrown: \(error)")
        }
    }

}
