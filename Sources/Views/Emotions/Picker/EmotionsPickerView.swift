//
//  EmotionsPickerView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct EmotionsPickerView: View {
    
    var viewModel: EmotionsPickerViewModel
    
    var body: some View {
        ZStack {
            ForEach(viewModel.items.indices) { index in
                self.scale(for: index)
                    .rotationEffect(self.angle(for: index), anchor: .center)
            }
        }
    }
    
    private func scale(for index: Int) -> some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                EmotionScaleView(viewModel: self.viewModel.scale(forItemAt: index))
                    .frame(size: self.boundingBox(in: geometry))
                Text("")
                    .frame(minWidth: 0, maxWidth: .infinity)
            }.padding([.leading, .trailing], self.padding(in: geometry))
        }
    }
    
    private func angle(for index: Int) -> Angle {
        let step = 360 / Double(viewModel.items.count)
        return .degrees(Double(index) * step + step / 2)
    }
    
    private func boundingBox(in geometry: GeometryProxy) -> CGSize {
        // height calculations
        let alpha = (2 * .pi) / CGFloat(viewModel.items.count)
        let height = sqrt(2 * pow(geometry.size.width / 2, 2) * (1 - cos(alpha)))
        // width calculations
        let width = sqrt(pow(geometry.size.width / 2, 2) - pow(height / 2, 2))
        return CGSize(width: width, height: height)
    }
    
    private func padding(in geometry: GeometryProxy) -> CGFloat {
        ((geometry.size.width / 2) - boundingBox(in: geometry).width) - 12
    }
    
}


struct EmotionsPickerView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionsPickerView(viewModel: EmotionsPickerViewModel())
            .clipShape(Circle())
            .padding(EdgeInsets(top: 32, leading: 32, bottom: 32, trailing: 32))
    }
}
