//
//  DrawingViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class DrawingViewModel: ObservableObject {
    
    private let builder: DrawingBuilder
    private let store: Store
    
    var title: String { Exercise.drawing.title.capitalized }
    
    @Published var emotion: Emotion { didSet { builder.emotion = emotion } }
    @Published var strokes: [Stroke] { didSet { builder.strokes = strokes } }
    
    init(builder: DrawingBuilder = DrawingBuilder(), store: Store) {
        self.builder = builder
        self.store = store
        if builder.timestamp == nil { builder.timestamp = Date() }
        if builder.emotion == nil { builder.emotion = .random }
        self.emotion = builder.emotion ?? .random
        self.strokes = builder.strokes
    }
    
    func save() {
        builder.build().map(store.save)
    }
    
}
