//
//  DashboardViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

final class DashboardViewModel {
    
    private let user: User
    let router: Router
    
    var title: String { "Hello, \(user.name)!" }
    var exercises: ExercisesViewModel {
        ExercisesViewModel(user: user, router: router)
    }
    var emotions: EmotionsViewModel {
        EmotionsViewModel(user: user)
    }
    
    init(user: User = .current, router: Router = .shared) {
        self.user = user
        self.router = router
    }
    
}
