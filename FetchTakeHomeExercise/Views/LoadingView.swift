//
//  LoadingView.swift
//  FetchTakeHomeExercise
//
//  Created by Andrew Stamm on 10/15/24.
//

import SwiftUI

struct LoadingView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        Text("Loading")
    }
}

#Preview {
    LoadingView().environmentObject(ContentViewModel())
}
