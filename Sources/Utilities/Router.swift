//
//  Router.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

class Router: ObservableObject {
    
    enum Path: Equatable {
        case launch
        indirect case dashboard(Path? = nil)
        case exercise(Exercise)
    }
    
    @Published var current: Path
    
    init(initial path: Path = .launch) {
        current = path
    }
    
}
