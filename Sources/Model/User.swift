//
//  User.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import UIKit

public struct User {
    let name: String
    let avatar: String?
}

final class UserBuilder {
    var name: String?
    var avatar: String?
    
    func build() -> User? {
        guard let name = name else { return nil }
        return User(name: name, avatar: avatar)
    }
}

extension User {
    static var mock: User {
        User(name: "Witek", avatar: "👨🏻‍💻")
    }
}

// The most epic user base
extension User {
    static var 👽: User { User(name: "Alien", avatar: "👽") }
    static var 🐻: User { User(name: "Bear", avatar: "🐻") }
    static var 🐱: User { User(name: "Cat", avatar: "🐱") }
    static var 🐔: User { User(name: "Chicken", avatar: "🐔") }
    static var 🐶: User { User(name: "Dog", avatar: "🐶") }
    static var 🐲: User { User(name: "Dragon", avatar: "🐲") }
    static var 🦊: User { User(name: "Fox", avatar: "🦊") }
    static var 👻: User { User(name: "Ghost", avatar: "👻") }
    static var 🐨: User { User(name: "Koala", avatar: "🐨") }
    static var 🦁: User { User(name: "Lion", avatar: "🦁") }
    static var 🐵: User { User(name: "Monkey", avatar: "🐵") }
    static var 🐼: User { User(name: "Panda", avatar: "🐼") }
    static var 🐷: User { User(name: "Pig", avatar: "🐷") }
    static var 💩: User { User(name: "Poo", avatar: "💩") }
    static var 🐰: User { User(name: "Rabbit", avatar: "🐰") }
    static var 🤖: User { User(name: "Robot", avatar: "🤖") }
    static var 💀: User { User(name: "Skull", avatar: "💀") }
    static var 🐯: User { User(name: "Tiger", avatar: "🐯") }
    static var 🦖: User { User(name: "T-Rex", avatar: "🦖") }
    static var 🦄: User { User(name: "Unicorn", avatar: "🦄") }
    static var 🐗: User { User(name: "Boar", avatar: "🐗" ) }
    static var 🦒: User { User(name: "Giraffe", avatar: "🦒" ) }
    static var 🦉: User { User(name: "Owl", avatar: "🦉" ) }
    static var 🦈: User { User(name: "Shark", avatar: "🦈" ) }
    static var 🐙: User { User(name: "Octopus", avatar: "🐙" ) }
    static var 🐮: User { User(name: "Cow Face", avatar: "🐮" ) }
}
