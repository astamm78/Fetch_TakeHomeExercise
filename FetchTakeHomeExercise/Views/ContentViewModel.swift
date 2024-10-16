//
//  ContentViewModel.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/15/24.
//

import Foundation

@MainActor
class ContentViewModel: ObservableObject {
    enum ViewState {
        case loading
        case networkError
        case recipes
    }
    
    var recipesEndpoint: String = RecipeNetwork.Endpoint.allRecipes
    
    @Published var recipes: RecipeCollection = []
    @Published var viewState: ViewState = .loading
    
    func loadRecipes() async {
        viewState = .loading
        
        do {
            let recipesNetworkResponse = try await RecipeNetwork.allRecipes(for: recipesEndpoint)
            
            self.recipes = recipesNetworkResponse.recipes
            self.viewState = .recipes
        } catch (let error) {
            print(String(describing: error))
            
            self.viewState = .networkError
        }
    }
    
}

extension ContentViewModel {
    static var jsonErrorTest: ContentViewModel {
        let viewModel = ContentViewModel()
        viewModel.viewState = .networkError
        return viewModel
    }
}
