//
//  GratitudeView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct GratitudeView: View {
    
    @ObservedObject var viewModel: GratitudeViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: viewModel.title)
            Spacer()
            VStack(alignment: .center) {
                Spacer()
                personQuestion
                Spacer()
                reasonQuestion
                Spacer()
                actionQuestion
                Spacer()
            }
                .fill()
                .aspectRatio(1, contentMode: .fit)
                .background(Color.white)
                .padding(EdgeInsets(top: 24, leading: 64, bottom: 24, trailing: 64))
            Spacer()
            controls
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
    
}

// MARK: - Subviews
extension GratitudeView {
    private var personQuestion: some View {
        QuestionView(
            title: viewModel.personQuestion,
            placeholder: viewModel.personPlaceholder,
            answer: $viewModel.person
        )
    }
    private var reasonQuestion: some View {
        QuestionView(
            title: viewModel.reasonQuestion,
            placeholder: viewModel.reasonPlaceholder,
            answer: $viewModel.reason
        )
    }
    private var actionQuestion: some View {
        QuestionView(
            title: viewModel.actionQuestion,
            placeholder: viewModel.actionPlaceholder,
            answer: $viewModel.action
        )
    }
    private var controls: some View {
        ZStack {
            Button(action: viewModel.save) {
                Text(Strings.continue)
                    .font(Style.Font.font(style: .headline))
                    .foregroundColor(.white)
                    .bold()
                    .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
                    .background(Style.Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
        }.padding(.all, 12)
    }
}

struct GratitudeView_Previews: PreviewProvider {
    static var previews: some View {
        GratitudeView(viewModel: GratitudeViewModel())
            .environmentObject(Router())
    }
}
