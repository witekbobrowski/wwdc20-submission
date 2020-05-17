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
    @EnvironmentObject var store: Store
    
    var body: some View {
        ZStack {
            if router.current == .launch {
                LaunchView(viewModel: LaunchViewModel(store: store))
                    .transition(.move(edge: .bottom))
                
            } else if router.current == .dashboard() {
                DashboardView(viewModel: DashboardViewModel(store: store))
                
            } else if router.current == .dashboard(.exercise(.emotions)) {
                EmotionsView(viewModel: EmotionsViewModel(store: store))
                    .transition(.move(edge: .bottom))
                
            } else if router.current == .dashboard(.exercise(.drawing)) {
                DrawingView(viewModel: DrawingViewModel(store: store))
                    .transition(.move(edge: .bottom))
                
            } else if router.current == .dashboard(.exercise(.affirmations)) {
                AffirmationsView(viewModel: AffirmationsViewModel(store: store))
                    .transition(.move(edge: .bottom))
                
            } else if router.current == .dashboard(.exercise(.gratitude)) {
                GratitudeView(viewModel: GratitudeViewModel(store: store))
                    .transition(.move(edge: .bottom))
                
            } else if router.current == .profile {
                ProfileView(viewModel: ProfileViewModel(store: store))
                    .transition(.move(edge: .bottom))
            }
        }.animation(.easeInOut(duration: 0.3))
    }
    
}
