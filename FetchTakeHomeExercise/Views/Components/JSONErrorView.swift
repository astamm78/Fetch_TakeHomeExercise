//
//  JSONErrorView.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/15/24.
//

import SwiftUI

struct JSONErrorView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 18) {
                Image(systemName: "network.slash")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .center)
                    .foregroundStyle(.gray.opacity(0.25))
                
                Text("We're sorry, there was\nan error loading recipes")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.gray)
            }
            .padding()
        }
    }
}

#Preview {
    JSONErrorView()
        .environmentObject(ContentViewModel())
}
