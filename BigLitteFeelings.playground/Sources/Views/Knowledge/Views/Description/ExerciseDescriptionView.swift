//
//  ExerciseDescriptionView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 18/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct ExerciseDescriptionView: View {
    
    var viewModel: ExerciseDescriptionViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            Text(viewModel.title)
                .font(Style.Font.font(style: .title))
                .foregroundColor(Style.Color.black)
                .kerning(0.5)
                .multilineTextAlignment(.center)
            Text(viewModel.description)
                .font(Style.Font.font(style: .headline))
                .foregroundColor(Style.Color.black)
                .multilineTextAlignment(.center)
                .padding()
                .background(Style.Color.lighterGray)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .shadow(color: Style.Color.lighterGray, radius: 4)
        }.padding([.leading, .trailing], 34)
    }
    
}

struct ExerciseDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDescriptionView(
            viewModel: ExerciseDescriptionViewModel(exercise: .emotions)
        )
    }
}
