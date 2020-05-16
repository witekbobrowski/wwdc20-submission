//
//  Emotions.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

struct EmotionsSnapshot {
    let timestamp: Date
    let emotions: [Emotion: Int]
}

final class EmotionsBuilder {
    var timestamp: Date?
    var emotions = [Emotion: Int]()
    
    func build() -> EmotionsSnapshot? {
        guard let timestamp = timestamp, !emotions.isEmpty else { return nil }
        return EmotionsSnapshot(timestamp: timestamp, emotions: emotions)
    }
}


