//
//  Emotion.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

enum Emotion: String, CaseIterable {
    case sadness
    case joy
    case shame
    case anger
    case excitement
    case disgust
    case love
    case envy
    case surprise
    case boredom
    case peace
    case fear
}

extension Emotion: Identifiable {
    var id: String { rawValue }
}

extension Emotion {
    static var random: Emotion { Self.allCases.randomElement()! }
    var emoji: String {
        switch self {
        case .sadness: return "😞"
        case .joy: return "😋"
        case .shame: return "😖"
        case .anger: return "😡"
        case .excitement: return "🤩"
        case .disgust: return "🤢"
        case .love: return "🥰"
        case .envy: return "🥺"
        case .surprise: return "🤭"
        case .boredom: return "🥱"
        case .peace: return "😌"
        case .fear: return "😧"
        }
    }
}
