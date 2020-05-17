//
//  RootView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

public struct RootView: View {
    
    @ObservedObject private var router = Router()
    @ObservedObject private var store = Store()
    
    public var body: some View {
        ZStack {
            if router.current == .launch {
                LaunchView(viewModel: LaunchViewModel(store: store))
                    .transition(.move(edge: .bottom))
                
            } else if router.current == .dashboard() {
                DashboardView(viewModel: DashboardViewModel(store: store))
                
            } else if emotions(from: router.current) != nil {
                emotions(from: router.current).map {
                    EmotionsView(
                        viewModel: EmotionsViewModel(builder: $0, store: store)
                    ).transition(.move(edge: .bottom))
                }
                
            } else if drawing(from: router.current) != nil {
                drawing(from: router.current).map {
                    DrawingView(
                        viewModel: DrawingViewModel(builder: $0, store: store)
                    ).transition(.move(edge: .bottom))
                }
                
            } else if router.current == .dashboard(.exercise(.affirmations())) {
                AffirmationsView(viewModel: AffirmationsViewModel(
                    store: store
                )).transition(.move(edge: .bottom))
                
            } else if gratitude(from: router.current) != nil {
                gratitude(from: router.current).map {
                    GratitudeView(
                        viewModel: GratitudeViewModel(builder: $0, store: store)
                    ).transition(.move(edge: .bottom))
                }
                
            } else if router.current == .profile {
                ProfileView(
                    viewModel: ProfileViewModel(store: store)
                ).transition(.move(edge: .bottom))
                
            } else if router.current == .knowledge {
                KnowledgeView(
                    viewModel: KnowledgeViewModel()
                ).transition(.move(edge: .bottom))
            }
        }.animation(.easeInOut(duration: 0.3))
            .environmentObject(router)
            .environmentObject(store)
    }
    
    private func exercise(from path: Router.Path?) -> Router.ExercisePath? {
        if case .dashboard(let subpath) = path {
            if case .exercise(let exercise) = subpath { return exercise }
        }
        return nil
    }
    
    private func emotions(from path: Router.Path?) -> EmotionsBuilder? {
        if let path = exercise(from: path) {
            if case .emotions(let emotions) = path {
                let builder = EmotionsBuilder()
                builder.uuid = emotions?.uuid
                builder.timestamp = emotions?.timestamp
                builder.emotions = emotions?.emotions ?? [:]
                return builder
            }
        }
        return nil
    }
    
    private func drawing(from path: Router.Path?) -> DrawingBuilder? {
        if let path = exercise(from: path) {
            if case .drawing(let drawing) = path {
                let builder = DrawingBuilder()
                builder.uuid = drawing?.uuid
                builder.timestamp = drawing?.timestamp
                builder.emotion = drawing?.emotion
                builder.strokes = drawing?.strokes ?? []
                return builder
            }
        }
        return nil
    }
    
    private func gratitude(from path: Router.Path?) -> GratitudeBuilder? {
        if let path = exercise(from: path) {
            if case .gratitude(let gratitude) = path {
                let builder = GratitudeBuilder()
                builder.uuid = gratitude?.uuid
                builder.timestamp = gratitude?.timestamp
                builder.person = gratitude?.person
                builder.reason = gratitude?.reason
                builder.action = gratitude?.action
                return builder
            }
        }
        return nil
    }
    
}
