//
//  AboutView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Swift Student Challenge")
                .font(Style.Font.chalk(style: .title1))
                .foregroundColor(.white)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .padding([.bottom], 12)
            Text("author: Witek Bobrowski")
                .font(Style.Font.chalk(style: .headline))
                .foregroundColor(.white)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .offset(CGSize(width: 0, height: 8))
            Image("avatar")
                .resizable()
                .foregroundColor(.white)
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 90, height: 90, alignment: .center)
                .offset(CGSize(width: 0, height: 8))
        }
            .padding([.leading, .top, .trailing], 16)
            .background(Style.Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .shadow(radius: 8)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
