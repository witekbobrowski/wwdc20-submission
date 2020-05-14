//
//  MenuCardViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

final class MenuCardViewModel {

    let exercise: Exercise
    
    var icon: String { exercise.icon }
    var title: String { exercise.title }
    var subtitle: String { exercise.shortDescription }
    
    init(exercise: Exercise = .emotions) {
        self.exercise = exercise
    }
    
}
