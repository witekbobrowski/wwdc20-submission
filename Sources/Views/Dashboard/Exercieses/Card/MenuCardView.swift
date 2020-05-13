//
//  MenuCardView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct MenuCardView: View  {
    
    var viewModel: MenuCardViewModel
    var accentColor: Color
    
    var body: some View {
        Button(action: { self.viewModel.action() }) {
            VStack(alignment: .center, spacing: 8) {
                Text(viewModel.icon)
                    .font(.system(size: 80))
                    .bold()
                Text(viewModel.title)
                    .font(Style.Font.font(style: .title))
                    .bold()
                    .kerning(0.5)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                Text(viewModel.subtitle)
                    .font(Style.Font.font(style: .title))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .foregroundColor(.black)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .padding(.all, 16)
        .background(accentColor)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }

}

struct MenuCardView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCardView(
            viewModel: MenuCardViewModel(exercise: .gratitude),
            accentColor: Style.Color.blue
        )
    }
}
