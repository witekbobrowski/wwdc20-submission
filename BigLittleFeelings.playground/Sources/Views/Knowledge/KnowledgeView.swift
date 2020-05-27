//
//  KnowledgeView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 18/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct KnowledgeView: View {
    
    var viewModel: KnowledgeViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HeaderView(title: viewModel.title)
            LogoView(fontSize: 40)
            subtitle.offset(x: 0, y: -16)
            text.padding([.leading, .trailing, .bottom], 32)
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 32) {
                        self.descriptions.frame(width: geometry.size.width, alignment: .center)
                        self.thankYou.padding([.bottom], 12)
                    }.fillVertically()
                }
            }
            AboutView().padding([.bottom], 12)
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
}

extension KnowledgeView {
    private var subtitle: some View {
        Text(viewModel.subtitle)
            .font(Style.Font.chalk(style: .headline))
            .bold()
            .foregroundColor(Style.Color.black)
            .multilineTextAlignment(.center)
    }
    private var text: some View {
        Text(viewModel.text)
            .font(Style.Font.font(style: .headline))
            .foregroundColor(Style.Color.black)
            .multilineTextAlignment(.center)
    }
    private var descriptions: some View {
        VStack(spacing: 32) {
            ExerciseDescriptionView(viewModel: self.viewModel.emotions)
            ExerciseDescriptionView(viewModel: self.viewModel.drawing)
            ExerciseDescriptionView(viewModel: self.viewModel.affirmations)
            ExerciseDescriptionView(viewModel: self.viewModel.gratitude)
        }
    }
    private var thankYou: some View {
        Text(viewModel.thankYou)
            .font(Style.Font.chalk(style: .headline))
            .bold()
            .foregroundColor(Style.Color.black)
            .multilineTextAlignment(.center)
    }
}

struct KnowledgeView_Previews: PreviewProvider {
    static var previews: some View {
        KnowledgeView(viewModel: KnowledgeViewModel())
            .environmentObject(Router())
    }
}
