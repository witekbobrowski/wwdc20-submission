//
//  EmotionsView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 12/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct EmotionsView: View {
    
    var viewModel: EmotionsViewModel
    @State var rotation: Angle = .zero
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView(title: viewModel.title)
            Spacer()
            EmotionsPickerView(viewModel: viewModel.pickerViewModel)
                .aspectRatio(1, contentMode: .fit)
                .rotationEffect(rotation, anchor: .center)
                .animation(.easeInOut)
            Spacer()
            RotationView(
                viewModel: viewModel.rotationViewModel, rotation: $rotation
            ).frame(minWidth: 0, maxWidth: .infinity)
            Spacer()
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
    
}


struct EmotionsView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionsView(viewModel: EmotionsViewModel())
    }
}
