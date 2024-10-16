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
        NavigationStack {
            mainView
                .task {
                    await viewModel.loadRecipes()
                }
                .navigationTitle("Recipes".uppercased())
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            Task {
                                await viewModel.loadRecipes()
                            }
                        } label: {
                            Text("Refresh")
                        }

                    }
                }
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
    viewModel.recipesEndpoint = .malformedJSON
    
    return ContentView().environmentObject(viewModel)
}

#Preview("w/ Empty State") {
    let viewModel = ContentViewModel()
    viewModel.recipesEndpoint = .emptyResponse
    
    return ContentView().environmentObject(viewModel)
}
