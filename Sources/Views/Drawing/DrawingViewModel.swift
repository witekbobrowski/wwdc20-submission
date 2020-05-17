//
//  DrawingViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class DrawingViewModel: ObservableObject {
    
    let builder: DrawingBuilder
    
    var title: String { Exercise.drawing.title.capitalized }
    
    @Published var emotion: Emotion { didSet { builder.emotion = emotion } }
    @Published var strokes: [Stroke] { didSet { builder.strokes = strokes } }
    
    init(builder: DrawingBuilder = DrawingBuilder()) {
        self.builder = builder
        if builder.timestamp == nil { builder.timestamp = Date() }
        if builder.emotion == nil { builder.emotion = .random }
        self.emotion = builder.emotion ?? .random
        self.strokes = builder.strokes
    }
    
    func save() {
        print(builder.build())
    }
    
}
