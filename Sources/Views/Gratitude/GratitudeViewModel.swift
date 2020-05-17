//
//  GratitudeViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class GratitudeViewModel {
    
    let builder: GratitudeBuilder
    
    var title: String { Exercise.gratitude.title.capitalized }
    
    var personQuestion: String { "I am greatful to" }
    var personPlaceholder: String { "my mom..." }
    var reasonQuestion: String { "for" }
    var reasonPlaceholder: String { "always..." }
    var actionQuestion: String { "and I will show it by" }
    var actionPlaceholder: String { "letting her know that..." }
    
    init(builder: GratitudeBuilder = GratitudeBuilder()) {
        self.builder = builder
        if builder.timestamp == nil { builder.timestamp = Date() }
    }
    
    func save() {
        print(builder.build())
    }
    
}
