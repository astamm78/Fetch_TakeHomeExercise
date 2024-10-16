//
//  ThumbnailView.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/16/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ThumbnailView: View {
    var url: URL?
    
    var body: some View {
        WebImage(url: url) { image in
            image
                .resizable()
                .frame(width: 120, height: 120, alignment: .center)
                .cornerRadius(12)
        } placeholder: {
            VStack {
                Image(systemName: "photo.artframe")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.white.opacity(0.5))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: .center)
            }
            .frame(width: 120, height: 120, alignment: .center)
            .background(.gray)
            .cornerRadius(12)
        }
    }
}

#Preview {
    ThumbnailView(
        url: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg")
    )
}
