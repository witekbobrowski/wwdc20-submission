//
//  HistoryViewModel.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

final class HistoryViewModel {
    
    enum Item {
        case emotions(EmotionsLog)
        case drawing(Drawing)
        case affirmations(String)
        case gratitude(Gratitude)
    }
    
    private let store: Store
    private let formatter = DateFormatter()
    
    private(set) var items = [Item]()
    
    init(store: Store) {
        self.store = store
        self.items = buildItems()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
    }
    
    func icon(for item: Item) -> String {
        if case .emotions(let emotions) = item, emotions.emotions.count == 1 {
            return emotions.emotions.first!.key.emoji
        }
        return item.exercise.icon
    }
    
    func title(for item: Item) -> String {
        if case .emotions(let emotions) = item, emotions.emotions.count == 1 {
            return "Emotion"
        }
        return item.exercise.title.capitalized
    }
    
    func subtitle(for item: Item) -> String {
        var items = [formatter.string(from: item.timestamp)]
        switch item {
        case .emotions(let emotions):
            if emotions.emotions.count == 0 {
                break
            } else if emotions.emotions.count == 1 {
                if let (key, value) = emotions.emotions.first {
                    items.append("\(key.rawValue.capitalized) \(value + 1)/5")
                }
            } else {
                items.append("\(emotions.emotions.count) Emotions")
            }
        case .drawing(let drawing):
            items.append(drawing.emotion.rawValue.capitalized)
        case .affirmations:
            break
        case .gratitude(let gratitude):
            gratitude.person.map { items.append($0) }
        }
        return items.joined(separator: " · ")
    }
    
    func path(for item: Item) -> Router.Path {
        switch item {
        case .emotions(let emotions):
            return .dashboard(.exercise(.emotions(emotions)))
        case .drawing(let drawing):
            return .dashboard(.exercise(.drawing(drawing)))
        case .affirmations(let affirmations):
            return .dashboard(.exercise(.affirmations(affirmations)))
        case .gratitude(let gratitude):
            return .dashboard(.exercise(.gratitude(gratitude)))
        }
    }
    
    private func buildItems() -> [Item] {
        var items = [Item]()
        items.append(contentsOf: store.emotions.values.map { .emotions($0) })
        items.append(contentsOf: store.drawings.values.map { .drawing($0) })
        items.append(contentsOf: store.gratitudes.values.map { .gratitude($0) })
        return items.sorted { $0.timestamp > $1.timestamp }
    }
    
}

extension HistoryViewModel.Item {
    var timestamp: Date {
        switch self {
        case .emotions(let emotions):
            return emotions.timestamp
        case .drawing(let drawing):
            return drawing.timestamp
        case .affirmations:
            return Date()
        case .gratitude(let gratitude):
            return gratitude.timestamp
        }
    }
    var exercise: Exercise {
        switch self {
        case .emotions: return Exercise.emotions
        case .drawing: return Exercise.drawing
        case .affirmations: return Exercise.affirmations
        case .gratitude: return Exercise.gratitude
        }
    }
}
    
