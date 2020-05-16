//
//  DrawingTitleView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct DrawingTitleView: View {
    
    @Binding var emotion: Emotion
    
    var body: some View {
        VStack {
            Text("I look like this when I feel")
                .font(Style.Font.font(size: 23))
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 4)
            Text(emotion.rawValue.capitalized)
                .font(Style.Font.chalk(size: 28))
                .underline()
                .bold()
                .multilineTextAlignment(.center)
                .frame(width: 300, alignment: .center)
        }
    }
}

struct DrawingTitleView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingTitleView(emotion: .constant(.boredom))
    }
}
