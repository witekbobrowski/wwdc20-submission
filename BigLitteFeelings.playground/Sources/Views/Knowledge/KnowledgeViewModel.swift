//
//  KnowledgeViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 18/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class KnowledgeViewModel {
    
    var title: String { "About" }
    var subtitle: String { "Mindfulness for Kids" }
    var text: String { "Big Little Feelings is an app that demonstrates different techniques of introducing kids to the subject of Emotional Intelligence and Mindfulness. Bundled exercises can be performed alone by the older kids but it is recommended to assist them while playing with the app, since detailed explanation can be highly beneficial in the process of learning and we encourage turning every in-app activity into a deeper conversation with the child." }
    var thankYou: String { "Thank you for taking your time and playing with the submission!" }
    
    var emotions: ExerciseDescriptionViewModel {
        ExerciseDescriptionViewModel(exercise: .emotions)
    }
    var drawing: ExerciseDescriptionViewModel {
        ExerciseDescriptionViewModel(exercise: .drawing)
    }
    var affirmations: ExerciseDescriptionViewModel {
        ExerciseDescriptionViewModel(exercise: .affirmations)
    }
    var gratitude: ExerciseDescriptionViewModel {
        ExerciseDescriptionViewModel(exercise: .gratitude)
    }
}
