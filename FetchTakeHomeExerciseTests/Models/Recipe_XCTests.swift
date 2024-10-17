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
    
    // MARK: - Codable
    
    func testExpectedCodingKeysArePresent() throws {
        let values = Recipe.CodingKeys.allCases
        XCTAssertEqual(values, [.cuisine, .name, .uuid, .photoURLLarge, .photoURLSmall, .sourceURL, .youtubeURL])
    }
    
    var codingKeyTestData: Data {
        return """
        {
            "uuid": "12345",
            "name": "Pasta",
            "cuisine": "Italian",
            "photo_url_large": "https://example.com/large.jpg",
            "photo_url_small": "https://example.com/small.jpg",
            "source_url": "https://example.com/source",
            "youtube_url": "https://youtube.com/video"
        }
        """.data(using: .utf8)!
    }
    
    func testCodingKeys_encoding() throws {
        let decoder = JSONDecoder()
        let recipe = try decoder.decode(Recipe.self, from: codingKeyTestData)
        
        XCTAssertEqual(recipe.uuid, "12345")
        XCTAssertEqual(recipe.name, "Pasta")
        XCTAssertEqual(recipe.cuisine, "Italian")
        XCTAssertEqual(recipe.photoURLLarge, URL(string: "https://example.com/large.jpg"))
        XCTAssertEqual(recipe.photoURLSmall, URL(string: "https://example.com/small.jpg"))
        XCTAssertEqual(recipe.sourceURL, URL(string: "https://example.com/source"))
        XCTAssertEqual(recipe.youtubeURL, URL(string: "https://youtube.com/video"))
    }
    
    func testCodingKeys_decoding() throws {
        let decoder = JSONDecoder()
        let recipe = try decoder.decode(Recipe.self, from: codingKeyTestData)
        
        let encoder = JSONEncoder()
        let encodedData = try encoder.encode(recipe)
        let encodedJSON = try JSONSerialization.jsonObject(with: encodedData, options: []) as? [String: Any]
        
        XCTAssertEqual(encodedJSON?["uuid"] as? String, "12345")
        XCTAssertEqual(encodedJSON?["name"] as? String, "Pasta")
        XCTAssertEqual(encodedJSON?["cuisine"] as? String, "Italian")
        XCTAssertEqual(encodedJSON?["photo_url_large"] as? String, "https://example.com/large.jpg")
        XCTAssertEqual(encodedJSON?["photo_url_small"] as? String, "https://example.com/small.jpg")
        XCTAssertEqual(encodedJSON?["source_url"] as? String, "https://example.com/source")
        XCTAssertEqual(encodedJSON?["youtube_url"] as? String, "https://youtube.com/video")
    }
    
    // MARK: - URL encoding
    
    /// I'm only testing `Recipe.sourceURL` here, but the same logic applies
    /// for `photoURLLarge`, `photoURLSmall`, and `youtubeURL`
    
    func testURLSAreInstantiatedCorrectly_withAValidURLString() throws {
        let recipe = Recipe.customPreview(from: "Recipe_validURLString")
        
        XCTAssert(recipe.sourceURL != nil, "URL should not be nil if given a valid URL string")
    }
    
    func testURLIsHandledGracefull_withNoURLString() throws {
        let recipe = Recipe.customPreview(from: "Recipe_noURLString")
        
        XCTAssert(recipe.sourceURL == nil, "URL should be nil if not given a URL string")
    }

}
