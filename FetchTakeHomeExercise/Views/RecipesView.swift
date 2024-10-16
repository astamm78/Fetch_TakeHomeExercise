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
            List {
                ForEach(viewModel.recipes) { recipe in
                    Text(recipe.name)
                }
            }
        }
    }
}

#Preview {
    RecipesView()
        .environmentObject(ContentViewModel())
}
