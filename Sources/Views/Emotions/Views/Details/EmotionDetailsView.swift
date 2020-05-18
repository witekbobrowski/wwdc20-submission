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
            title
            Spacer(minLength: 12)
            description.padding([.leading,  .trailing], 64)
            Spacer(minLength: 12)
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
    private var title: some View {
        Text(viewModel?.title ?? "")
            .font(Style.Font.font(size: 44))
            .foregroundColor(Style.Color.black)
            .kerning(0.5)
            .multilineTextAlignment(.center)
    }
    private var description: some View {
        Text(viewModel?.description ?? "")
            .font(Style.Font.font(style: .title))
            .foregroundColor(Style.Color.black)
            .multilineTextAlignment(.center)
            .minimumScaleFactor(0.5)
    }
}

struct EmotionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionDetailsView(viewModel: .constant(EmotionDetailsViewModel(emotion: .anger)))
    }
}
