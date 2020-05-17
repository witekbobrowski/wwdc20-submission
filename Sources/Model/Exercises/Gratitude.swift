//
//  Gratitude.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

struct Gratitude {
    let uuid: UUID
    let timestamp: Date
    let person: String?
    let reason: String?
    let action: String?
}

final class GratitudeBuilder {
    var uuid: UUID?
    var timestamp: Date?
    var person: String?
    var reason: String?
    var action: String?
    
    func build() -> Gratitude? {
        guard let timestamp = timestamp else { return nil }
        return Gratitude(
            uuid: uuid ?? UUID(),
            timestamp: timestamp,
            person: person,
            reason: reason,
            action: action
        )
    }
}


extension Gratitude: Equatable {}
