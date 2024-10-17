//
//  ContentViewModel_XCTests.swift
//  FetchTakeHomeExerciseTests
//
//  Created by Andrew Stamm on 10/16/24.
//

import XCTest
@testable import FetchTakeHomeExercise

@MainActor
final class ContentViewModel_XCTests: XCTestCase {

    func testInitialState() {
        let viewModel = ContentViewModel()

        XCTAssertEqual(viewModel.viewState, .loading, "Initial viewState should be `.loading`.")
        XCTAssertTrue(viewModel.recipes.isEmpty, "Recipes should be empty on initialization.")
    }
    
    func testLoadRecipesSuccessfully() async {
        let viewModel = ContentViewModel()
        await viewModel.loadRecipes()
        
        XCTAssertEqual(viewModel.viewState, .recipes, "viewState should be `.recipes` when recipes are loaded successfully.")
        XCTAssertEqual(viewModel.recipes.count, 63, "Recipes array count should be 63 if loaded successfully.")
        XCTAssertTrue(!viewModel.recipes.isEmpty, "Recipes should not be empty after successful load.")
    }
    
    func testLoadRecipesMalformedJSONError() async {
        let viewModel = ContentViewModel.jsonErrorTest
        viewModel.recipesEndpoint = RecipesEndpoint.malformedJSON
        await viewModel.loadRecipes()
        
        XCTAssertEqual(viewModel.viewState, .networkError, "viewState should be `.networkError` when a JSON error occurs.")
        XCTAssertTrue(viewModel.recipes.isEmpty, "Recipes should remain empty when there's a network error.")
    }

}
