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
    @Binding var selected: Exercise?
    
    var emotions: EmotionsViewModel { EmotionsViewModel(user: user) }
    
    init(
        user: User = .current,
        selected: Binding<Exercise?> = .constant(nil)
    ) {
        self.user = user
        self._selected = selected
    }
    
    func card(for exercise: Exercise) -> MenuCardViewModel {
        MenuCardViewModel(
            exercise: exercise,
            isSelected: Binding(
                get: { [weak self] in self?.selected == exercise },
                set: { [weak self] in self?.selected = $0 ? exercise : nil }
            )
        )
    }
    
}
