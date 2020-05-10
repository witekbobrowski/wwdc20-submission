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
                MenuCardView(
                    viewModel: self.viewModel.emotions,
                    accentColor: Style.Color.purple
                ).frame(minWidth: 0, maxWidth: .infinity)
                MenuCardView(
                    viewModel: self.viewModel.drawing,
                    accentColor: Style.Color.green
                ).frame(minWidth: 0, maxWidth: .infinity)
            }
            HStack(alignment: .center, spacing: 24) {
                MenuCardView(
                    viewModel: viewModel.affirmations,
                    accentColor: Style.Color.red
                ).frame(minWidth: 0, maxWidth: .infinity)
                MenuCardView(
                    viewModel: viewModel.gratitude,
                    accentColor: Style.Color.blue
                ).frame(minWidth: 0, maxWidth: .infinity)
            }
        }.frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(viewModel: ExercisesViewModel())
    }
}
