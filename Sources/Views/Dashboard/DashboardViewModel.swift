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
    
    var title: String { "hello, \(user.name)!" }
    var exercises: ExercisesViewModel {
        ExercisesViewModel(user: user)
    }
    var emotions: EmotionsViewModel {
        EmotionsViewModel(user: user)
    }
    
    init(user: User = .current) {
        self.user = user
    }
    
}
