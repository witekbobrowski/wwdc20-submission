//
//  DashboardViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

final class DashboardViewModel {
    
    private let store: Store
    
    var title: String { "Hello, \(store.user.name)!" }
    var exercises: ExercisesViewModel {
        ExercisesViewModel(user: store.user)
    }
    
    init(store: Store) {
        self.store = store
    }
    
}
