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
        Text("JSON Error")
    }
}

#Preview {
    JSONErrorView()
        .environmentObject(ContentViewModel())
}
