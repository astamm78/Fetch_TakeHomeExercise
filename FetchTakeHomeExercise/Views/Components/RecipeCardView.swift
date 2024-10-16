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
            HStack(alignment: .top) {
                ThumbnailView(url: recipe.photoURLSmall)
                
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .font(.title2)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text(recipe.cuisine)
                        .font(.subheadline)
                    
                    VStack(alignment: .leading) {
                        sourceLink
                        
                        youtubeLink
                    }
                    .padding(.top, 12)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .padding(8)
        .background(.gray.opacity(0.25))
        .cornerRadius(16)
    }
    
    @ViewBuilder
    var sourceLink: some View {
        recipe.sourceURL.map { url in
            UrlLink(caption: "View Source", url: url)
        }
    }
    
    @ViewBuilder
    var youtubeLink: some View {
        recipe.youtubeURL.map { url in
            UrlLink(caption: "View on YouTube", url: url)
        }
    }
}

#Preview {
    RecipeCardView(recipe: Recipe.preview)
}

#Preview("W/ no Image") {
    var recipe = Recipe.preview
    recipe.photoURLSmall = nil
    
    return RecipeCardView(recipe: recipe)
}
