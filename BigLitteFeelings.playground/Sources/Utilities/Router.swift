//
//  Router.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

class Router: ObservableObject {
    
    enum Path: Equatable {
        case launch
        indirect case dashboard(Path? = nil)
        case exercise(ExercisePath)
        case profile
        case knowledge
    }
    
    enum ExercisePath: Equatable {
        case emotions(EmotionsLog? = nil)
        case drawing(Drawing? = nil)
        case affirmations(String? = nil)
        case gratitude(Gratitude? = nil)
    }
    
    @Published var current: Path
    
    init(initial path: Path = .launch) {
        current = path
    }
    
}
