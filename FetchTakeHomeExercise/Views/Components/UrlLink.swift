//
//  UrlLink.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/16/24.
//

import SwiftUI

struct UrlLink: View {
    var caption: String
    var url: URL
    
    var body: some View {
        Link(destination: url) {
            Text(caption)
                .font(.caption)
        }
    }
}

#Preview {
    UrlLink(caption: "Link", url: URL(string: "https://google.com")!)
}
