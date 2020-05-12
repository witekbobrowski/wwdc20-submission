//
//  DashboardViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

final class DashboardViewModel: ObservableObject {
    
    private let user: User
    
    @Binding var presenting: Exercise?
    
    var header: HeaderViewViewModel {
        HeaderViewViewModel(user: user)
    }
    var exercises: ExercisesViewModel {
        ExercisesViewModel(user: user, selected: $presenting)
    }
    var emotions: EmotionsViewModel {
        EmotionsViewModel(user: user)
    }
    
    init(
        user: User = .current, presenting: Binding<Exercise?> = .constant(nil)
    ) {
        self.user = user
        self._presenting = presenting
    }
    
}
