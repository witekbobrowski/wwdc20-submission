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
    
    @Published var rotation: Angle = .zero
    
    var title: String { "Emotions" }
    var pickerViewModel: EmotionsPickerViewModel {
        EmotionsPickerViewModel()
    }
    var rotationViewModel: RotationViewModel {
        RotationViewModel(rotation: _rotation)
    }
    
    init(user: User = User(name: "Witek")) {
        self.user = user
    }
    
}
