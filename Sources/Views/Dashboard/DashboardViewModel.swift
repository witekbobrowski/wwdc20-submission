//
//  DashboardViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class DashboardViewModel {
    
    private let user: User
    
    var header: HeaderViewViewModel {
        HeaderViewViewModel(user: user)
    }
    var exercises: ExercisesViewModel {
        ExercisesViewModel()
    }
    
    init(user: User = User(name: "Witek")) {
        self.user = user
    }
    
}
