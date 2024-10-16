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
        ZStack {
            LottieView(
                animationFileName: "LoadingAnimation.json",
                loopMode: .loop
            )
            .frame(width: 200, height: 200)
        }
        
    }
}

#Preview {
    LoadingView().environmentObject(ContentViewModel())
}
