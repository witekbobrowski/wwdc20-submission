//
//  EmotionsPickerViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class EmotionsPickerViewModel {
    
    let items: [Emotion]
    
    init(items: [Emotion] = Emotion.allCases) {
        self.items = items
    }
    
    func scale(forItemAt index: Int) -> EmotionScaleViewModel {
        EmotionScaleViewModel(emotion: items[index])
    }
    
}
