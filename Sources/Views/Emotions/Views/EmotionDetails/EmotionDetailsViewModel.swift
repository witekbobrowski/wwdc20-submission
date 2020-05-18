//
//  EmotionDetailsViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 18/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class EmotionDetailsViewModel {
    
    private let emotion: Emotion
    
    var title: String { emotion.emoji + " " + emotion.rawValue.capitalized }
    var description: String { "emotion.emoji + asda + emotion.rawValue.capitalized" }
    
    init(emotion: Emotion) {
        self.emotion = emotion
    }
    
}

extension EmotionDetailsViewModel: Identifiable {
    var id: String { emotion.id }
}
