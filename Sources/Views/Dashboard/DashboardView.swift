//
//  DashboardView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct DashboardView: View  {
    
    var viewModel: DashboardViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView(title: self.viewModel.title)
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    Spacer(minLength: 64)
                    ExercisesView(viewModel: self.viewModel.exercises)
                    Spacer()
                }
                .frame(width: geometry.size.width, alignment: .center)
            }
            FooterView()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(Style.Color.background)
    }
    
    private func destination(for exercise: Exercise?) -> some View {
        return EmotionsView(viewModel: EmotionsViewModel())
    }
    
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: DashboardViewModel())
    }
}
