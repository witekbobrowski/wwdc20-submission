//
//  EmotionsViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 12/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

final class EmotionsViewModel: ObservableObject {
    
    private let builder: EmotionsBuilder
    private let store: Store
    
    @Published private var emotions = [Emotion: Int]()
    
    var title: String { Exercise.emotions.title.capitalized }
    var question: String {
        "What emotions did I experience today?"
    }
    var disclosure: String {
        "ⓘ Number of colored trapezoids represents strenght of the emotion."
    }
    var pickerViewModel: EmotionsPickerViewModel {
        EmotionsPickerViewModel(builder: builder)
    }
    var rotationViewModel: RotationViewModel {
        RotationViewModel()
    }
    
    init(builder: EmotionsBuilder = EmotionsBuilder(), store: Store) {
        self.builder = builder
        self.store = store
        if builder.timestamp == nil { builder.timestamp = Date() }
    }
    
    func save() {
        builder.build().map(store.save)
    }
    
}
