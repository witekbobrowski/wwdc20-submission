//
//  User.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import UIKit

struct User {
    let name: String
    let avatar: UIImage?
}

final class UserBuilder {
    var name: String?
    var avatar: UIImage?
    
    func build() -> User? {
        guard let name = name else { return nil }
        return User(name: name, avatar: avatar)
    }
}

extension User {
    static var mock: User {
        User(name: "Witek", avatar: UIImage(named: "avatar"))
    }
}
