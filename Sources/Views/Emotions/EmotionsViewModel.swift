//
//  EmotionsViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 12/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

final class EmotionsViewModel: ObservableObject {
    
    private let user: User
    private let builder: EmotionsBuilder
    
    @Published private var emotions = [Emotion: Int]()
    
    var title: String { "Emotions" }
    var pickerViewModel: EmotionsPickerViewModel {
        EmotionsPickerViewModel(builder: builder)
    }
    var rotationViewModel: RotationViewModel {
        RotationViewModel()
    }
    
    init(user: User = User(name: "Witek"), builder: EmotionsBuilder = EmotionsBuilder()) {
        self.user = user
        self.builder = builder
        if builder.timestamp == nil { builder.timestamp = Date() }
    }
    
    func save() {
        print(builder.emotions)
    }
    
}
