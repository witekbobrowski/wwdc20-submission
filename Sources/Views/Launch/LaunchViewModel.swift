//
//  LaunchViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class LaunchViewModel: ObservableObject {
    
    private let builder: UserBuilder
    
    var hello: HelloViewModel { HelloViewModel(builder: builder) }
    
    init(builder: UserBuilder = UserBuilder()) {
        self.builder = builder
    }
    
    func save() {
        print(builder.build())
    }
    
}
