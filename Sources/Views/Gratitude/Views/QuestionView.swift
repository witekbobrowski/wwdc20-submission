//
//  QuestionView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    
    let title: String
    let placeholder: String
    @Binding var answer: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(Style.Font.font(style: .largeTitle))
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 12)
            TextField(placeholder, text: $answer)
                .font(Style.Font.chalk(style: .largeTitle))
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .multilineTextAlignment(.center)
        }.padding([.leading, .trailing], 12)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(
            title: "I am greatuful to", placeholder: "my mom...", answer: .constant("")
        )
    }
}
