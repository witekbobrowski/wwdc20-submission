//
//  EmotionsPickerViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class EmotionsPickerViewModel {
    
    private let builder: EmotionsBuilder
    let items: [Emotion]
    
    init(items: [Emotion] = Emotion.allCases, builder: EmotionsBuilder = EmotionsBuilder()) {
        self.items = items
        self.builder = builder
    }
    
    func scale(forItemAt index: Int) -> EmotionScaleViewModel {
        EmotionScaleViewModel(emotion: items[index], builder: builder)
    }
    
}
