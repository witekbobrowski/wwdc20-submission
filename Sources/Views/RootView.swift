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
            if router.current == .launch {
                LaunchView(viewModel: LaunchViewModel())
                    .transition(.move(edge: .bottom))
            } else if router.current == .dashboard() {
                DashboardView(viewModel: DashboardViewModel())
            } else if router.current == .dashboard(.exercise(.emotions)) {
                EmotionsView(viewModel: EmotionsViewModel())
                    .transition(.move(edge: .bottom))
            } else if router.current == .dashboard(.exercise(.drawing)) {
                DrawingView(viewModel: DrawingViewModel())
                    .transition(.move(edge: .bottom))
            } else if router.current == .dashboard(.exercise(.affirmations)) {
                AffirmationsView(viewModel: AffirmationsViewModel())
                    .transition(.move(edge: .bottom))
            } else if router.current == .dashboard(.exercise(.gratitude)) {
                GratitudeView(viewModel: GratitudeViewModel())
                    .transition(.move(edge: .bottom))
            }
        }.animation(.easeInOut(duration: 0.3))
    }
    
}
