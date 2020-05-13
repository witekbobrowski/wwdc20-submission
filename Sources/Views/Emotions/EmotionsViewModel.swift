//
//  EmotionsViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 12/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class EmotionsViewModel {
    
    private let user: User
    
    var title: String { "Emotions" }
    
    init(user: User = User(name: "Witek")) {
        self.user = user
    }
    
}
