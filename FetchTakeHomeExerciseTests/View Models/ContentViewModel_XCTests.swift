//
//  ContentViewModel_XCTests.swift
//  FetchTakeHomeExerciseTests
//
//  Created by Andrew Stamm on 10/16/24.
//

import XCTest
@testable import FetchTakeHomeExercise

final class ContentViewModel_XCTests: XCTestCase {

    @MainActor
    func testInitialState() {
        let viewModel = ContentViewModel()

        XCTAssertEqual(viewModel.viewState, .loading, "Initial viewState should be `.loading`.")
        XCTAssertTrue(viewModel.recipes.isEmpty, "Recipes should be empty on initialization.")
    }
    
    @MainActor
    func testLoadRecipesSuccessfully() async {
        let viewModel = ContentViewModel()
        await viewModel.loadRecipes()
        
        XCTAssertEqual(viewModel.viewState, .recipes, "viewState should be `.recipes` when recipes are loaded successfully.")
        XCTAssertEqual(viewModel.recipes.count, 65, "Recipes array count should be 65 if loaded successfully.")
        XCTAssertTrue(!viewModel.recipes.isEmpty, "Recipes should not be empty after successful load.")
    }
    
    @MainActor
    func testLoadRecipesMalformedJSONError() async {
        let viewModel = ContentViewModel.jsonErrorTest
        viewModel.recipesEndpoint = NetworkService.Endpoint.malformedJSON
        await viewModel.loadRecipes()
        
        XCTAssertEqual(viewModel.viewState, .networkError, "viewState should be `.networkError` when a JSON error occurs.")
        XCTAssertTrue(viewModel.recipes.isEmpty, "Recipes should remain empty when there's a network error.")
    }

}
