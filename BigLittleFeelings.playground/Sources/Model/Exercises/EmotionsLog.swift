//
//  EmotionsSnapshot.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

struct EmotionsLog {
    let uuid: UUID
    let timestamp: Date
    let emotions: [Emotion: Int]
}

final class EmotionsBuilder {
    var uuid: UUID?
    var timestamp: Date?
    var emotions = [Emotion: Int]()
    
    func build() -> EmotionsLog? {
        guard let timestamp = timestamp, !emotions.isEmpty else { return nil }
        return EmotionsLog(
            uuid: uuid ?? UUID(),
            timestamp: timestamp,
            emotions: emotions
        )
    }
}

extension EmotionsLog: Equatable {}
