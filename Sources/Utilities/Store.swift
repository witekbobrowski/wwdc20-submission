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
    private (set) var emotions = [EmotionsLog]()
    private (set) var drawings = [Drawing]()
    private (set) var gratitudes = [Gratitude]()
    
}

// MARK: - Saving
extension Store {
    
    func save(_ user: User) {
        self.user = user
    }
    func save(_ item: EmotionsLog) {
        emotions.append(item)
    }
    func save(_ item: Drawing) {
        drawings.append(item)
    }
    func save(_ item: Gratitude) {
        gratitudes.append(item)
    }
    
}

// MARK: - Mock
extension Store {
    static var mock: Store {
        let store = Store()
        store.save(.mock)
        store.save(EmotionsLog(timestamp: Date(), emotions: [.anger: 1]))
        store.save(Drawing(timestamp: Date().addingTimeInterval(-360), emotion: .anger, strokes: []))
        return store
    }
}
