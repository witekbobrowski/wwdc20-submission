//
//  ProfileViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class ProfileViewModel {
    
    private let store: Store
    
    var title: String { "Your Profile" }
    
    init(store: Store) {
        self.store = store
    }

}
