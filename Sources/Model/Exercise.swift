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

extension Exercise {
    var title: String {
        switch self {
        case .emotions:
            return "Emotions"
        case .drawing:
            return "Drawing"
        case .affirmations:
            return "Affirmations"
        case .gratitude:
            return "Gratitude"
        }
    }
    var icon: String {
        switch self {
        case .emotions:
            return "🕸"
        case .drawing:
            return "🎨"
        case .affirmations:
            return "🌟"
        case .gratitude:
            return "🙌"
        }
    }
    var shortDescription: String {
        switch self {
        case .emotions:
            return "Short description of the exercise"
        case .drawing:
            return "Short description of the exercise"
        case .affirmations:
            return "Short description of the exercise"
        case .gratitude:
            return "Short description of the exercise"
        }
    }
}
