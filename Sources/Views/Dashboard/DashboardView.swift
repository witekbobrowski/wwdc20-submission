//
//  DashboardView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct DashboardView: View  {
    
    @ObservedObject var viewModel: DashboardViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView(viewModel: viewModel.header)
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    Spacer(minLength: 64)
                    ExercisesView(viewModel: self.viewModel.exercises)
                    Spacer()
                }
                .frame(width: geometry.size.width, alignment: .center)
            }
        }
        .padding(EdgeInsets(top: 64, leading: 32, bottom: 64, trailing: 32))
        .background(Color(white: 0.98))
        .sheet(item: viewModel.$presenting, content: destination)
    }
    
    private func destination(for exercise: Exercise) -> some View {
        return EmotionsView(viewModel: EmotionsViewModel())
    }
    
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: DashboardViewModel())
    }
}
