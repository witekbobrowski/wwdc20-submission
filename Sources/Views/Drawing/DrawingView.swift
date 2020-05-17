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
    
    @State var strokes: [Stroke] = [] {
        didSet { viewModel.builder.strokes = strokes }
    }
    @State var emotion: Emotion = .anger {
        didSet { viewModel.builder.emotion = emotion }
    }
    @State var color: Color = .black
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: viewModel.title)
            Spacer(minLength: 12)
            DrawingTitleView(emotion: $emotion)
            Spacer(minLength: 12)
            canvas
            controls
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
    
    init(viewModel: DrawingViewModel) {
        self.viewModel = viewModel
        self.emotion = viewModel.builder.emotion ?? .fear
        self.strokes = viewModel.builder.strokes
        self.color = Style.Color.black
    }
    
}

// MARK: - Subviews
extension DrawingView {
    private var canvas: some View {
        CanvasView(strokes: $strokes, color: $color)
            .aspectRatio(1, contentMode: .fit)
            .shadow(color: Style.Color.lightGray, radius: 32, x: 0, y: 0)
    }
    private var controls: some View {
        ZStack {
            HStack {
                ColorPickerView(selected: $color)
                Spacer()
            }
            HStack {
                Spacer()
                Button(action: { self.emotion = Emotion.allCases.randomElement()! }) {
                    Text("🎲 try different emotion")
                        .font(Style.Font.font(style: .footnote))
                }.foregroundColor(Color(white: 0.2)).padding(.trailing, 12)
            }
            Button(action: viewModel.save) {
                Text("Continue")
                    .font(Style.Font.font(style: .headline))
                    .foregroundColor(.white)
                    .bold()
                    .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
                    .background(Style.Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
        }.padding(.all, 12)
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView(viewModel: DrawingViewModel())
            .environmentObject(Router())
    }
}
