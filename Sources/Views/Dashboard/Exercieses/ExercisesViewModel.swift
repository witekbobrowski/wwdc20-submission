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
    private let router: Router
    
    var emotions: EmotionsViewModel { EmotionsViewModel(user: user) }
    
    init(user: User = .current, router: Router = .shared) {
        self.user = user
        self.router = router
    }
    
    func card(for exercise: Exercise) -> MenuCardViewModel {
        MenuCardViewModel(exercise: exercise, router: router)
    }
    
}
