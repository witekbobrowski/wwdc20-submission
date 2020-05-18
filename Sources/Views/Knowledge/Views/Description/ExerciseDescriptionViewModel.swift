//
//  ExerciseDescriptionViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 18/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class ExerciseDescriptionViewModel {
    
    private let exercise: Exercise
    
    var title: String { exercise.icon + " " + exercise.title.capitalized }
    var description: String { exercise.longDescription }
    
    init(exercise: Exercise) {
        self.exercise = exercise
    }
    
}
