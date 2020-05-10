//
//  ExercisesViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class ExercisesViewModel {
    
    var emotions: MenuCardViewModel { MenuCardViewModel(exercise: .emotions) }
    var drawing: MenuCardViewModel { MenuCardViewModel(exercise: .drawing) }
    var affirmations: MenuCardViewModel { MenuCardViewModel(exercise: .affirmations) }
    var gratitude: MenuCardViewModel { MenuCardViewModel(exercise: .gratitude) }
    
}
