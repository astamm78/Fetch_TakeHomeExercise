//
//  Recipe_XCTests.swift
//  FetchTakeHomeExerciseTests
//
//  Created by Andrew Stamm on 10/16/24.
//

import XCTest
@testable import FetchTakeHomeExercise

final class Recipe_XCTests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}
    
    func testURLSAreInstantiatedCorrectly_withAValidURLString() throws {
        let recipe = Recipe.customPreview(from: "Recipe_validURLString")
        
        XCTAssert(recipe.sourceURL != nil, "URL should not be nil if given a valid URL string")
    }
    
    func testURLIsHandledGracefull_withNoURLString() throws {
        let recipe = Recipe.customPreview(from: "Recipe_noURLString")
        
        XCTAssert(recipe.sourceURL == nil, "URL should be nil if not given a URL string")
    }

}
