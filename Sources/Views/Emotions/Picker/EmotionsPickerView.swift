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
                    .frame(
                        height: self.height(for: index, geometry: geometry)
                    )
                    .frame(minWidth: 0, maxWidth: .infinity)
                Text("")
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
    
    private func angle(for index: Int) -> Angle {
        let step = 360 / Double(viewModel.items.count)
        return .degrees(Double(index) * step)
    }
    
    private func height(for index: Int, geometry: GeometryProxy) -> CGFloat {
        (geometry.size.width * .pi) / CGFloat(viewModel.items.count)
    }
    
}


struct EmotionsPickerView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionsPickerView(viewModel: EmotionsPickerViewModel())
    }
}
