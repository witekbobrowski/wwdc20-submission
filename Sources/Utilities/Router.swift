//
//  Router.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

class Router: ObservableObject {
    
    static let shared = Router()
    
    @Published var presented: Exercise?
    
}
