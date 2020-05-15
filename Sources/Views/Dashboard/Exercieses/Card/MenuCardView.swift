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
    @EnvironmentObject private var router: Router
    
    var body: some View {
        Button(action: { self.router.current = .dashboard(.exercise(self.viewModel.exercise)) }) {
            VStack(alignment: .center, spacing: 8) {
                Text(viewModel.icon)
                    .font(.system(size: 64))
                    .bold()
                Text(viewModel.title)
                    .font(Style.Font.chalk(style: .title1))
                    .bold()
                    .kerning(0.5)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                Text(viewModel.subtitle)
                    .font(Style.Font.chalk(style: .headline))
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .foregroundColor(.black)
            }.fillHorizontally()
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
