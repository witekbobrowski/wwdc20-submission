//
//  Drawing.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct Drawing {
    let timestamp: Date
    let emotion: Emotion
    let strokes: [Stroke]
}

struct Stroke {
    var color: Color
    var points = [CGPoint]()
}

final class DrawingBuilder {
    var timestamp: Date?
    var emotion: Emotion?
    var strokes = [Stroke]()
    
    func build() -> Drawing? {
        guard let timestamp = timestamp, let emotion = emotion else { return nil }
        return Drawing(timestamp: timestamp, emotion: emotion, strokes: strokes)
    }
}

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

extension Stroke: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(color)
        hasher.combine(points)
    }
}
