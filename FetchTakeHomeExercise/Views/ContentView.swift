//
//  ContentView.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/15/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        mainView
            .task {
                await viewModel.loadRecipes()
            }
    }
    
    @ViewBuilder
    var mainView: some View {
        switch viewModel.viewState {
        case .loading:
            LoadingView()
        case .networkError:
            JSONErrorView()
        case .recipes:
            RecipesView()
        }
    }
}

#Preview("w/ Recipes") {
    ContentView().environmentObject(ContentViewModel())
}

#Preview("w/ JSON Error") {
    let viewModel = ContentViewModel()
    viewModel.recipesEndpoint = RecipeNetwork.Endpoint.malformedJSON
    
    return ContentView().environmentObject(viewModel)
}

#Preview("w/ Empty State") {
    let viewModel = ContentViewModel()
    viewModel.recipesEndpoint = RecipeNetwork.Endpoint.emptyResponse
    
    return ContentView().environmentObject(viewModel)
}
