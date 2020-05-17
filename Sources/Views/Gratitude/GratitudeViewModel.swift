//
//  GratitudeViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class GratitudeViewModel: ObservableObject {
    
    private let builder: GratitudeBuilder
    private let store: Store
    
    var title: String { Exercise.gratitude.title.capitalized }
    
    var personQuestion: String { "I am greatful to" }
    var personPlaceholder: String { "my mom..." }
    var reasonQuestion: String { "for" }
    var reasonPlaceholder: String { "always..." }
    var actionQuestion: String { "and I will show it by" }
    var actionPlaceholder: String { "letting her know that..." }
    
    @Published var person: String { didSet { builder.person = person } }
    @Published var reason: String { didSet { builder.reason = reason } }
    @Published var action: String { didSet { builder.action = action } }
    
    init(builder: GratitudeBuilder = GratitudeBuilder(), store: Store) {
        self.builder = builder
        self.store = store
        self.person = builder.person ?? ""
        self.reason = builder.reason ?? ""
        self.action = builder.action ?? ""
        if builder.timestamp == nil { builder.timestamp = Date() }
    }
    
    func save() {
        builder.build().map(store.save)
    }
    
}
