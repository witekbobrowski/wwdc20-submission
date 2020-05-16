//
//  DrawingView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct DrawingView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Hello, World!")
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
