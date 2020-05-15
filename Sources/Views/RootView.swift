//
//  RootView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack {
            if router.presented == .emotions {
                EmotionsView(viewModel: EmotionsViewModel())
            } else {
                DashboardView(viewModel: DashboardViewModel())
            }
//            LaunchView()
        }
    }
    
}
