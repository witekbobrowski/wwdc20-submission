//
//  User.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

struct User {
    let name: String
}

final class UserBuilder {
    var name: String?
    
    func build() -> User? {
        guard let name = name else { return nil }
        return User(name: name)
    }
}

extension User {
    static var current: User {
        User(name: "Witek")
    }
}
