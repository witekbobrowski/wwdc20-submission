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
        VStack(spacing: 0) {
            HeaderView(title: viewModel.title)
            Spacer()
            EmotionsPickerView(viewModel: viewModel.pickerViewModel)
                .aspectRatio(1, contentMode: .fit)
                .rotationEffect(rotation, anchor: .center)
                .animation(.easeInOut)
            Spacer()
            ZStack {
                RotationView(
                    viewModel: viewModel.rotationViewModel, rotation: $rotation
                ).frame(minWidth: 0, maxWidth: .infinity)
                Button(action: viewModel.save) {
                    Text("Continue")
                        .font(Style.Font.font(style: .headline))
                        .foregroundColor(.white)
                        .bold()
                        .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
                        .background(Style.Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
            }.padding(.bottom, 24)
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
    
}


struct EmotionsView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionsView(viewModel: EmotionsViewModel())
            .environmentObject(Router())
    }
}
