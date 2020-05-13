//
//  EmotionScaleView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct EmotionScaleView: View {
    
    var viewModel: EmotionScaleViewModel
    
    var body: some View {
        HStack {
            Group {
                Text(viewModel.title)
                    .font(Style.Font.font(size: 22))
                    .bold()
                    .rotationEffect(.degrees(-90), anchor: .center)
                .frame(width: 256)
            }.frame(width: 18)
            HStack(alignment: .center, spacing: 12) {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.gray)
            }
        }
    }
}



struct EmotionScaleView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionScaleView(viewModel: EmotionScaleViewModel(emotion: .anger))
    }
}
