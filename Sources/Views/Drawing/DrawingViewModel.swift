//
//  DrawingViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class DrawingViewModel {
    
    let builder: DrawingBuilder
    
    var title: String { Exercise.drawing.title.capitalized }
    
    init(builder: DrawingBuilder = DrawingBuilder()) {
        self.builder = builder
        if builder.timestamp == nil { builder.timestamp = Date() }
        if builder.emotion == nil { builder.emotion = newEmotion() }
    }
    
    func newEmotion() -> Emotion {
        Emotion.allCases.randomElement()!
    }
    
    func save() {
        
    }
    
}
