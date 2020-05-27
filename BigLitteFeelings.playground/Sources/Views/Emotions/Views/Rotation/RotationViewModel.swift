//
//  RotationViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 15/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

final class RotationViewModel {
    
    var leftSymbol: String { "rotate.left" }
    var rightSymbol: String { "rotate.right" }
    
    func left(_ current: Angle) -> Angle {
        Angle(degrees: current.degrees - 30)
    }
    func right(_ current: Angle) -> Angle {
        Angle(degrees: current.degrees + 30)
    }
    
}
