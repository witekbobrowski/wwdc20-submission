//
//  HeaderViewViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class HeaderViewViewModel {
    
    private let user: User
    
    var title: String { "Hello, \(user.name)!" }
    
    init(user: User = .current) {
        self.user = user
    }

}
