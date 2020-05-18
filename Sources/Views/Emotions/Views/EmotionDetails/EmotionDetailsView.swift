//
//  EmotionDetailsView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 18/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct EmotionDetailsView: View {
    
    @Binding var viewModel: EmotionDetailsViewModel?
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            close
            Spacer()
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
    
}

extension EmotionDetailsView {
    private var close: some View {
        HStack {
            Spacer()
            Button(action: { self.viewModel = nil  }) {
                Image(systemName: "xmark")
                    .resizable()
                    .padding(.all, 15)
                    .foregroundColor(Style.Color.black)
                    .frame(width: 50, height: 50, alignment: .center)
                    .background(Style.Color.lightGray)
                    .clipShape(Circle())
                    .shadow(color: Style.Color.lightGray, radius: 4)
            }
        }.fillHorizontally()
    }
}

struct EmotionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionDetailsView(viewModel: .constant(EmotionDetailsViewModel(emotion: .anger)))
    }
}
