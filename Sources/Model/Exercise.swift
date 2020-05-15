//
//  Exercise.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

enum Exercise: String {
    case emotions
    case drawing
    case affirmations
    case gratitude
}

extension Exercise: Identifiable {
    var id: String { rawValue }
}

extension Exercise {
    var title: String {
        switch self {
        case .emotions:
            return "emotions"
        case .drawing:
            return "drawing"
        case .affirmations:
            return "affirmations"
        case .gratitude:
            return "gratitude"
        }
    }
    var icon: String {
        switch self {
        case .emotions:
            return "🕸"
        case .drawing:
            return "🎨"
        case .affirmations:
            return "🧧"
        case .gratitude:
            return "🌸"
        }
    }
    var shortDescription: String {
        switch self {
        case .emotions:
            return "short description of the exercise"
        case .drawing:
            return "short description of the exercise"
        case .affirmations:
            return "short description of the exercise"
        case .gratitude:
            return "short description of the exercise"
        }
    }
}
