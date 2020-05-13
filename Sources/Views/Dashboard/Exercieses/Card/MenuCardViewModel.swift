//
//  MenuCardViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

final class MenuCardViewModel {

    private let exercise: Exercise
    private let router: Router
    
    var icon: String { exercise.icon }
    var title: String { exercise.title }
    var subtitle: String { exercise.shortDescription }
    
    init(exercise: Exercise = .emotions, router: Router = .shared) {
        self.exercise = exercise
        self.router = router
    }

    func action() {
        router.presented = exercise
    }
    
}
