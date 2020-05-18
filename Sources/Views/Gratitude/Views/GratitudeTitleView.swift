//
//  GratitudeTitleView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 18/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct GratitudeTitleView: View {
    var body: some View {
        VStack {
            Text("Today I am grateful for what I have")
                .font(Style.Font.chalk(size: 23))
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 4)
        }.foregroundColor(Style.Color.black)
            .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
            .background(Style.Color.accentColor(for: .gratitude))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(color: Style.Color.lightGray, radius: 2)
    }
}

struct GratitudeTitleView_Previews: PreviewProvider {
    static var previews: some View {
        GratitudeTitleView()
    }
}
