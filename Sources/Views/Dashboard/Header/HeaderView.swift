//
//  HeaderView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct HeaderView: View  {
    
    @State var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(Style.Font.font(size: 48))
                .kerning(0.5)
                .multilineTextAlignment(.leading)
            Spacer()
            if Router.shared.presented != nil {
                Button(action: { Router.shared.presented = nil }) {
                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 24, height: 24, alignment: .center)
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity)
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Hello :)")
    }
}
