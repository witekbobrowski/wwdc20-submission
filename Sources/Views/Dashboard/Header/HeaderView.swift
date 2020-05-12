//
//  HeaderView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct HeaderView: View  {
    
    var viewModel: HeaderViewViewModel
    
    var body: some View {
        Text(viewModel.title)
            .font(Style.Font.font(size: 64))
            .kerning(0.5)
            .multilineTextAlignment(.leading)
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(viewModel: HeaderViewViewModel())
    }
}
