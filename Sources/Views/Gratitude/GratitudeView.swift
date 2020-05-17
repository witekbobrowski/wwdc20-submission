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
    
    @State private var person = "" {
        didSet { viewModel.builder.person = person }
    }
    @State private var reason = "" {
        didSet { viewModel.builder.reason = reason }
    }
    @State private var action = "" {
        didSet { viewModel.builder.reason = reason }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: viewModel.title)
            Spacer()
            VStack(alignment: .center, spacing: 24) {
                personQuestion
                reasonQuestion
                actionQuestion
            }
            Spacer()
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
    
    init(viewModel: GratitudeViewModel) {
        self.viewModel = viewModel
        self.person = viewModel.builder.person ?? ""
        self.reason = viewModel.builder.reason ?? ""
        self.action = viewModel.builder.action ?? ""
    }
    
}

// MARK: - Subviews
extension GratitudeView {
    private var personQuestion: some View {
        QuestionView(
            title: viewModel.personQuestion,
            placeholder: viewModel.personPlaceholder,
            answer: $person
        )
    }
    private var reasonQuestion: some View {
        QuestionView(
            title: viewModel.reasonQuestion,
            placeholder: viewModel.reasonPlaceholder,
            answer: $reason
        )
    }
    private var actionQuestion: some View {
        QuestionView(
            title: viewModel.actionQuestion,
            placeholder: viewModel.actionPlaceholder,
            answer: $action
        )
    }
}

struct GratitudeView_Previews: PreviewProvider {
    static var previews: some View {
        GratitudeView(viewModel: GratitudeViewModel())
            .environmentObject(Router())
    }
}
