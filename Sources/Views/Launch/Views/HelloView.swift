//
//  HelloView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 15/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct HelloView: View {
    
    @State var name = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("hello")
                    .font(Style.Font.font(size: 32))
                    .bold()
                    .foregroundColor(.white)
                    .fillHorizontally()
                Text("MY NAME IS")
                    .font(Style.Font.font(size: 16))
                    .bold()
                    .foregroundColor(.white)
                    .fillHorizontally()
            }
                .padding([.top, .bottom], 6)
                .contentShape(Rectangle())
                .background(Style.Color.black)
            TextField("type your name :)", text: $name)
                .font(Style.Font.font(style: .largeTitle))
                .multilineTextAlignment(.center)
                .scaledToFit()
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .frame(minHeight: 80)
                .padding(.all, 8)
            ZStack {
                Rectangle()
                    .foregroundColor(Style.Color.black)
                    .fillHorizontally()
                    .frame(height: 32)
                Text("WWDC20")
                    .font(Style.Font.font(size: 12))
                    .foregroundColor(.white)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .fillHorizontally()
            }
        }.background(Style.Color.background)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(radius: 24)
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
            .frame(width: 300, height: 300, alignment: .center)
    }
}
