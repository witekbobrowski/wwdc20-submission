//
//  ExercisesView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct ExercisesView: View {

    var viewModel: ExercisesViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            HStack(alignment: .center, spacing: 24) {
                card(for: .emotions)
                card(for: .drawing)
            }
            HStack(alignment: .center, spacing: 24) {
                card(for: .affirmations)
                card(for: .gratitude)
            }
        }.frame(minWidth: 0, maxWidth: .infinity)
    }
    
    private func card(for exercise: Exercise) -> some View {
        MenuCardView(
            viewModel: viewModel.card(for: exercise),
            accentColor: accentColor(for: exercise)
        ).frame(minWidth: 0, maxWidth: .infinity)
    }

    private func accentColor(for exercise: Exercise) -> Color {
        switch exercise {
        case .emotions:
            return Style.Color.purple
        case .drawing:
            return Style.Color.green
        case .affirmations:
            return Style.Color.red
        case .gratitude:
            return Style.Color.blue
        }
    }

}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(viewModel: ExercisesViewModel())
    }
}
