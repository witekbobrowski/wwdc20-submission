//
//  GratitudeView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct GratitudeView: View {
    
    var viewModel: GratitudeViewModel
    
    @State var person = ""
    @State var reason = ""
    @State var action = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: viewModel.title)
            Spacer()
            VStack(alignment: .center, spacing: 24) {
                QuestionView(
                    title: "I am greatful to",
                    placeholder: "my mom...",
                    answer: $person
                )
                QuestionView(
                    title: "for",
                    placeholder: "always...",
                    answer: $reason
                )
                QuestionView(
                    title: "and I will show it by",
                    placeholder: "giving her...",
                    answer: $action
                )
            }
            Spacer()
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
    
}

struct GratitudeView_Previews: PreviewProvider {
    static var previews: some View {
        GratitudeView(viewModel: GratitudeViewModel())
            .environmentObject(Router())
    }
}
