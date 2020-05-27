//
//  AffirmationsViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

final class AffirmationsViewModel: ObservableObject {
    
    private let store: Store
    private var affirmations: [String] { [
        "I am able to share what I have with others",
        "I am spacial",
        "I have a good sense of humor",
        "I am important",
        "I can be brave",
        "I can learn from my mistakes",
        "I love myself",
        "I am able to listen to others",
        "I am proud of myslef",
        "I am able to take responsibility for my own acitons",
    ] }
    
    var title: String { Exercise.affirmations.title.capitalized }
    
    @Published var affirmation: String = ""
    
    init(store: Store) {
        self.store = store
        rollADice()
    }
    
    func rollADice() {
        affirmation = affirmations.randomElement()!
    }
    
}
