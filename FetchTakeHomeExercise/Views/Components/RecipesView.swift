//
//  RecipesView.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/15/24.
//

import SwiftUI

struct RecipesView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        if viewModel.recipes.isEmpty {
            EmptyStateView()
        } else {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.recipes) { recipe in
                        RecipeCardView(recipe: recipe)
                    }
                }
                .padding()
            }
            .refreshable {
                await viewModel.loadRecipes()
            }
        }
    }
}

#Preview {
    let viewModel = ContentViewModel()
    
    return RecipesView()
        .environmentObject(viewModel)
        .task {
            await viewModel.loadRecipes()
        }
}
