//
//  PhotoViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import UIKit

protocol PhotoViewModelDelegate: class {
    func didSet(new user: User)
}

final class PhotoViewModel: ObservableObject {
    
    private let builder: UserBuilder
    
    weak var delegate: PhotoViewModelDelegate?
    
    var placeholder: String { "person.fill" }
    var dice: String { "🎲" }
    
    @Published var avatar: String? { didSet { builder.avatar = avatar } }
    
    init(builder: UserBuilder = UserBuilder()) {
        self.builder = builder
        self.avatar = builder.avatar
    }
    
    func tossADice() {
        let users: [User] = [
            .👽, .🐻, .🐱, .🐔, .🐶, .🐲, .🦊, .👻, .🐨, .🦁, .🐵, .🐼, .🐷,
            .💩, .🐰, .🤖, .💀, .🐯, .🦖, .🦄, .🐗, .🦒, .🦉, .🦈, .🐙, .🐮
        ]
        guard let user = users.randomElement() else { return }
        builder.name = user.name
        avatar = user.avatar
        delegate?.didSet(new: user)
    }
    
}
