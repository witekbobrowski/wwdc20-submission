//
//  EmotionScaleView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct EmotionScaleView: View {

    private let titleWidth: CGFloat = 18
    private let spacing: CGFloat = 4
    
    var viewModel: EmotionScaleViewModel
    
    var body: some View {
        HStack {
            Group {
                Text(viewModel.title)
                    .font(Style.Font.font(size: 22))
                    .bold()
                    .rotationEffect(.degrees(-90), anchor: .center)
                    .frame(width: 256)
            }.frame(width: titleWidth)
            GeometryReader { geometry in
                HStack(alignment: .center, spacing: self.spacing) {
                    ForEach(self.viewModel.scale) { index in
                        self.trapezoid(for: index, in: geometry)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                }
            }
        }
    }
    
    private func trapezoid(for index: Int, in geometry: GeometryProxy) -> some View {
        let count = CGFloat(viewModel.scale.count)
        let size = actualSize(geometry.size)
        let offset = (spacing * (count - 1) / count)
        let width = ((size.width) / count) - offset
        let heightStep = (size.height / count)
        let height = size.height - (CGFloat(index) * heightStep)
        return Trapezoid(insetAmount: heightStep / 2)
            .frame(width: width, height: height)
            .foregroundColor(.gray)
    }
    
    private func actualSize(_ size: CGSize) -> CGSize {
        CGSize(
            width: size.width,
            height: size.height - ((size.width / size.height) * 18 / 2)
        )
    }
    
}



struct EmotionScaleView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionScaleView(viewModel: EmotionScaleViewModel(emotion: .anger))
            .frame(width: 320, height: 90)
    }
}
