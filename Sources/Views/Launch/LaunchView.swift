//
//  LaunchView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 15/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HelloView()
                .frame(width: 380, height: 380, alignment: .center)
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
