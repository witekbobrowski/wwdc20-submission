//
//  Store.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class Store: ObservableObject {
    
    private (set) var user: User = .mock
    private (set) var emotions = [UUID: EmotionsLog]()
    private (set) var drawings = [UUID: Drawing]()
    private (set) var gratitudes = [UUID: Gratitude]()
    
}

// MARK: - Saving
extension Store {
    
    func save(_ user: User) {
        self.user = user
    }
    func save(_ item: EmotionsLog) {
        emotions[item.uuid] = item
    }
    func save(_ item: Drawing) {
        drawings[item.uuid] = item
    }
    func save(_ item: Gratitude) {
        gratitudes[item.uuid] = item
    }
    
}

// MARK: - Mock
extension Store {
    static var mock: Store {
        let store = Store()
        store.save(.mock)
        store.save(EmotionsLog(uuid: UUID(), timestamp: Date(), emotions: [.anger: 1]))
        store.save(Drawing(uuid: UUID(), timestamp: Date().addingTimeInterval(-360), emotion: .anger, strokes: []))
        return store
    }
}
