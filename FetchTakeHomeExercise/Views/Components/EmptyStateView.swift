//
//  EmptyStateView.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/15/24.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 18) {
                Image(systemName: "book.closed.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .center)
                    .foregroundStyle(.gray.opacity(0.25))
                
                Text("We're sorry, no recipes\nare available at this time")
                    .foregroundStyle(.gray)
            }
            .padding()
        }
    }
}

#Preview {
    EmptyStateView()
}
