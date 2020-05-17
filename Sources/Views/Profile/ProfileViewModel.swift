//
//  ProfileViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import UIKit

final class ProfileViewModel {
    
    private let store: Store
    
    var title: String { "Your Profile" }
    
    var avatar: UIImage? { store.user.avatar }
    var name: String { store.user.name }
    
    init(store: Store) {
        self.store = store
    }

}
