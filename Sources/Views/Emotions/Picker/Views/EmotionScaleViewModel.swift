//
//  EmotionScaleViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 14/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class EmotionScaleViewModel {
    
    private let emotion: Emotion
    
    var title: String { emotion.rawValue.capitalized }
    
    init(emotion: Emotion) {
        self.emotion = emotion
    }
    
}
