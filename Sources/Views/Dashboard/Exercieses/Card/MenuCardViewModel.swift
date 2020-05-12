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
    @Binding private var isSelected: Bool
    
    var icon: String { exercise.icon }
    var title: String { exercise.title }
    var subtitle: String { exercise.shortDescription }
    
    init(exercise: Exercise, isSelected: Binding<Bool> = .constant(false)) {
        self.exercise = exercise
        self._isSelected = isSelected
    }
    
    func action() {
        print("did tap \(exercise.rawValue) card")
        isSelected = true
    }

}
