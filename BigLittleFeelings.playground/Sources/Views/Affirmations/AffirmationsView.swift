//
//  AffirmationsView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct AffirmationsView: View {
    
    @ObservedObject var viewModel: AffirmationsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: viewModel.title)
            Spacer()
            Text(viewModel.affirmation)
                .animation(.none)
                .font(Style.Font.chalk(style: .title1))
                .foregroundColor(Style.Color.black)
                .multilineTextAlignment(.center)
                .padding()
                .background(Style.Color.lighterGray)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .shadow(color: Style.Color.lighterGray, radius: 4)
            Button(action: viewModel.rollADice) {
                Text("🎲")
                    .font(Style.Font.font(style: .title))
            }.foregroundColor(Color(white: 0.2)).padding(.trailing, 12)
                .padding()
            Spacer()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
}

struct AffirmationsView_Previews: PreviewProvider {
    static var previews: some View {
        AffirmationsView(viewModel: AffirmationsViewModel(store: Store()))
    }
}
