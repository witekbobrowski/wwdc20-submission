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
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: viewModel.title)
            Spacer()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
    
}

struct GratitudeView_Previews: PreviewProvider {
    static var previews: some View {
        GratitudeView(viewModel: GratitudeViewModel())
    }
}
