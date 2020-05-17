//
//  PhotoViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import UIKit

final class PhotoViewModel: ObservableObject {
    
    private let builder: UserBuilder
    
    var placeholder: String { "person.fill" }
    var camera: String { "camera.fill" }
    
    @Published var avatar: String? { didSet { builder.avatar = avatar } }
    
    init(builder: UserBuilder = UserBuilder()) {
        self.builder = builder
        self.avatar = builder.avatar
    }
    
}
