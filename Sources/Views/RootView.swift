//
//  RootView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var router: Router
    
    private var dashboard: DashboardView {
        DashboardView(viewModel: DashboardViewModel())
    }
    
    var body: some View {
        Group {
            if router.presented == .emotions {
                dashboard
                    .overlay(EmotionsView(viewModel: EmotionsViewModel()))
                    .animation(.easeInOut)
            } else {
                dashboard
            }
        }
    }
    
}
