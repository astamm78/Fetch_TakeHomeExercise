//
//  RecipeCardView.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/16/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeCardView: View {
    var recipe: Recipe
    
    var body: some View {
        VStack {
            WebImage(url: recipe.photoURLSmall)
            
            Text(recipe.name)
            
            Link(destination: recipe.sourceURL!) {
                Text("Source")
            }
        }
    }
}

#Preview {
    RecipeCardView(recipe: Recipe.preview)
}
