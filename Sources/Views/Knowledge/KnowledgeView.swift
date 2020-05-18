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
            Spacer()
            AboutView().padding(.bottom, 12)
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
}

struct KnowledgeView_Previews: PreviewProvider {
    static var previews: some View {
        KnowledgeView(viewModel: KnowledgeViewModel())
    }
}
