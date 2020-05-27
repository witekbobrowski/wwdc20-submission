//
//  Emotion.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

enum Emotion: String, CaseIterable {
    case sadness
    case joy
    case shame
    case anger
    case excitement
    case disgust
    case love
    case envy
    case surprise
    case boredom
    case peace
    case fear
}

extension Emotion: Identifiable {
    var id: String { rawValue }
}

extension Emotion {
    static var random: Emotion { Self.allCases.randomElement()! }
    var emoji: String {
        switch self {
        case .sadness: return "😞"
        case .joy: return "😋"
        case .shame: return "😖"
        case .anger: return "😡"
        case .excitement: return "🤩"
        case .disgust: return "🤢"
        case .love: return "🥰"
        case .envy: return "🥺"
        case .surprise: return "🤭"
        case .boredom: return "🥱"
        case .peace: return "😌"
        case .fear: return "😧"
        }
    }
}

extension Emotion {
    var description: String {
        switch self {
        case .sadness: return "Sadness is an emotional pain characterized by feelings of disadvantage, loss, despair, grief, helplessness, disappointment and sorrow.\n\nSomeone who is experiencing sadness may become quiet or lethargic, and withdraw themselves from others.\n\nCrying​ can be an indication of sadness."
        case .joy: return "Happiness (or Joy) is a ​feeling​ of pleasure and positivity. When someone feels good, proud, relieved or satisfied about something, that person is said to be \"happy\". Feeling happy may help people to relax and to ​smile​.\n\nHappiness is usually thought of as the ​opposite​ of ​sadness​. However, it is possible to feel both at once, often about different things, or sometimes even about the same thing.\n\nThere is nobody who is always happy or always sad. Happiness sometimes causes people to cry when they laugh because the emotion takes control of them.\n\nHappiness is also a type where one and another like each other and really like to spend time together."
        case .shame: return "An unpleasant feeling that occurs when you feel like you made a mistake.\n\nThis emotion is rooted in a social or cultural environment. Some people feel shame when some of the rules (that are accepted by the respective society) have been broken. A person can feel ashamed because he or she has thought or done something no one else knows about.\n\nWhen you are ashamed you may feel sadness and anger towards yourself."
        case .anger: return "Anger is one of the basic ​emotions​. It happens when we feel ​threatened​, offended, wronged, or denied something we really want or need.\n\nThis feeling can accompany you when something bothers you or when you feel attacked.\n\nWhen you are angry, you can feel sudden heat in your body, your heart beating faster and your voice is getting louder.\n\nThere is a sharp distinction between anger and ​aggression​. Both influence each other. ​Rage​ is the strongest form of anger.\n\nFor example, you may feel anger when somebody took something of yours without asking for your permission. You feel that way, because in your opinion that was wrong."
        case .excitement: return "Excitement is a mental and ​emotional​ condition which makes a person feel extremely happy and really care about something that happened or is about to happen. These feelings are very strong and intense. For example, people may feel excited when in ​love​, or before a very important situation or event.\n\nWhen excited, you can feel more energy in your body."
        case .disgust: return "People feel disgust when they see, touch, hear, or taste something that they think is nasty or repulsive. It is also caused by scorn. For example, when one finds something dirty or not fit to eat. Levels of disgust vary based on cultural, religious, and personal backgrounds/experiences. Disgust can be deliberate as someone can do something on purpose to create this emotion."
        case .love: return "Love is the feeling of liking somebody or something very much. People sometimes get married or go on a date when someone loves another.\n\nThere are many kinds of love. There can be ​self-love​, love towards a friend, love in romance, towards ​family​, toward ​God​, or towards an object or idea.\n\nLove is based on ​respect​, ​understanding​, and being able to talk with each other.\n\nWith this emotion, you may feel happiness, warmness and solicitude towards an object, animal or someone you feel love to."
        case .envy: return "Emotion also known as jealousy. The term generally refers to the thoughts or feelings of insecurity, fear, concern, and envy over lack of possessions, status or something of great personal value.\n\nJealousy can consist of one or more emotions such as ​anger​, sadness, resentment, inadequacy, helplessness or ​disgust​.\n\nJealousy can either be suspicious or reactive, and it is often a series of particularly strong emotions and a universal human experience.\n\nWhen you are jealous, you may feel lower self-esteem, distrust, desire, and sometimes even a motivation to improve yourself."
        case .surprise: return "Surprise is an ​emotion​ that a ​person​ might feel if something unexpected happens. For example, a person may feel surprised at a loud, sudden ​noise​, like the popping of a ​balloon​, or they may feel surprised at the outcome of an event.\n\nThe feeling of surprise can be both good or bad, depending on the circumstances."
        case .boredom: return "Boredom is an ​emotional​ state that comes when a person has nothing to do, and is not interested in anything. To stop boredom, most people do something to occupy or amuse​ themselves.\n\nWhen you are bored, you may feel tired or dull. You can also have difficulties with staying focused."
        case .peace: return "Feeling peaceful is a very happy and positive emotion. A peaceful person do not have worries or does not feel any kind of anger or other stimulations. When you are at peace, your body feel relaxed and without tension. Your mind feels light, free of unnecessary negative thoughts.\n\nTo feel calm you can go for a long walk into the nature around you. When you are at home, you can sit and take a couple of deep breaths."
        case .fear: return "Fear is an ​emotion​ much like ​anxiety​. A person who fears something does not want it to happen, because they think something bad will happen to them if it does. Fear is the body's way of ​protecting​ itself from doing things that may be ​dangerous​. For example, if one has a fear of jumping off a ​cliff​, he/she will not do it. In this case, fear is a good thing but in others, it can be bad.\n\nAn example of fear being bad is if it stops one from doing something important, like going to see a doctor."
        }
    }
}
