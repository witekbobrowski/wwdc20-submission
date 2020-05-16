//
//  EmotionScaleViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 14/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class EmotionScaleViewModel: ObservableObject {
    
    private let emotion: Emotion
    private let builder: EmotionsBuilder
    
    @Published private var trigger = false
    
    let scale: Range<Int> = 0..<5
    var selected: Int? {
        get { convert(builder.emotions[emotion]) }
        set { select(newValue) }
    }
    
    var title: String { emotion.rawValue.capitalized }
    
    init(emotion: Emotion, builder: EmotionsBuilder = EmotionsBuilder()) {
        self.emotion = emotion
        self.builder = builder
    }
    
    private func select(_ index: Int?) {
        let selected = convert(index)
        if selected == self.selected {
            builder.emotions[emotion] = nil
        } else {
            builder.emotions[emotion] = selected
        }
        trigger.toggle()
    }
    
    private func convert(_ index: Int?) -> Int? {
        let reversed = Array(scale.reversed())
        guard let index = index, reversed.indices.contains(index) else { return nil }
        return reversed[index]
    }
    
}
