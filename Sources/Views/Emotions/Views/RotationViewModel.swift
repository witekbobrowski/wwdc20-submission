//
//  RotationViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 15/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

final class RotationViewModel {
    
    @Published var rotation: Angle
    
    var leftSymbol: String { "rotate.left" }
    var rightSymbol: String { "rotate.right" }
    
    init(rotation: Published<Angle>) {
        self._rotation = rotation
    }
    
    func left() {
        rotation = Angle(degrees: rotation.degrees - 90)
    }
    func right() {
        rotation = Angle(degrees: rotation.degrees + 90)
    }
    
}
