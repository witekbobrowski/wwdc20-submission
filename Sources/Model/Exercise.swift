//
//  Exercise.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import Foundation

enum Exercise: String {
    case emotions
    case drawing
    case affirmations
    case gratitude
}

extension Exercise: Identifiable {
    var id: String { rawValue }
}

extension Exercise {
    var title: String {
        switch self {
        case .emotions:
            return "emotions"
        case .drawing:
            return "drawing"
        case .affirmations:
            return "affirmations"
        case .gratitude:
            return "gratitude"
        }
    }
    var icon: String {
        switch self {
        case .emotions:
            return "🕸"
        case .drawing:
            return "🎨"
        case .affirmations:
            return "🧧"
        case .gratitude:
            return "🌸"
        }
    }
    var shortDescription: String {
        switch self {
        case .emotions:
            return "short description of the exercise"
        case .drawing:
            return "short description of the exercise"
        case .affirmations:
            return "short description of the exercise"
        case .gratitude:
            return "short description of the exercise"
        }
    }
    var longDescription: String {
        switch self {
        case .emotions:
            return "This exercise will help the child monitor his emotional state in a selected time area (e.g. now, today, this week, most often). Invite your child to review if the feeling accompany him/her. If so - propose to determine its intensity by coloring the appropriate number of boxes (the more colored boxes, the more intense the feeling). If not - the child can leave the boxes with the feeling without coloring."
        case .drawing:
            return "invite your child to imagine and then draw the emotion. It is best to draw what the emotion looks like on a face. You can simply ask - \"draw how you look when you feel joy.\" Completed images can be kept - great way for monitoring your child's emotional state (e.g. \"choose a picture that shows how you feel right now\")."
        case .affirmations:
            return "Invite your child to pick and read the sentences written in the cards and to choose the ones that fit him. Start a conversation - Ask your child questions about his picks. Ask what they can mean."
        case .gratitude:
            return "Invite your child to talk about gratitude. Encourage them to write down who they can be grateful for, what they can be grateful for and how they can show their gratitude. If necessary - let more than one card to be filled out."
        }
    }
}
