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
        VStack {
            HeaderView(title: viewModel.title)
            Spacer()
            EmotionsPickerView(viewModel: viewModel.pickerViewModel)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                .aspectRatio(1, contentMode: .fit)
                .rotationEffect(rotation, anchor: .center)
                .animation(.easeInOut)
            Spacer()
            RotationView(
                viewModel: viewModel.rotationViewModel, rotation: $rotation
            )
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .padding(EdgeInsets(top: 32, leading: 32, bottom: 32, trailing: 32))
        .background(Style.Color.background)
    }
    
}


struct EmotionsView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionsView(viewModel: EmotionsViewModel())
    }
}
