//
//  ExercisesViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

final class ExercisesViewModel {
    
    private let user: User
    
    var emotions: EmotionsViewModel { EmotionsViewModel(user: user) }
    
    init(user: User = .current) {
        self.user = user
    }
    
    func card(for exercise: Exercise) -> MenuCardViewModel {
        MenuCardViewModel(exercise: exercise)
    }
    
}
