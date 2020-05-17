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
    
    @Published var image: UIImage? { didSet { builder.avatar = image } }
    
    init(builder: UserBuilder = UserBuilder()) {
        self.builder = builder
        self.image = builder.avatar
    }
    
}

extension PhotoViewModel: ImagePickerDelegate {
    func imagePickerDidSelect(_ image: UIImage?) {
        self.image = image
    }
}
