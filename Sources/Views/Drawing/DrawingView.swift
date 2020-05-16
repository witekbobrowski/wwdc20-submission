//
//  DrawingView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct DrawingView: View {
    
    var viewModel: DrawingViewModel
    
    @State var drawing = Drawing()
    @State var color = Style.Color.black
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: viewModel.title)
            Spacer()
            CanvasView(drawing: $drawing, color: $color)
            ZStack {
                HStack {
                    ColorPickerView(selected: $color)
                    Spacer()
                }.padding(.leading, 12)
                Button(action: {}) {
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

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView(viewModel: DrawingViewModel())
            .environmentObject(Router())
    }
}
