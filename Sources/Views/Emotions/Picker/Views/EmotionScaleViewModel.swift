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
    
    let scale: Range<Int> = 0..<6
    
    var title: String { emotion.rawValue.capitalized }
    
    init(emotion: Emotion) {
        self.emotion = emotion
    }
    
}
