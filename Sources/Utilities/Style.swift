//
//  Style.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

enum Style {
    enum Color {
        static let purple = SwiftUI.Color(red: 230/255, green: 207/255, blue: 230/255)
        static let green = SwiftUI.Color(red: 162/255, green: 195/255, blue: 182/255)
        static let red = SwiftUI.Color(red: 239/255, green: 185/255, blue: 164/255)
        static let blue = SwiftUI.Color(red: 75/255, green: 76/255, blue: 164/255)
    }
    enum Font {
        static func font(size: CGFloat) -> SwiftUI.Font {
            SwiftUI.Font.system(size: size, weight: .regular, design: .rounded)
        }
        static func font(style: SwiftUI.Font.TextStyle) -> SwiftUI.Font {
            SwiftUI.Font.system(style, design: .rounded)
        }
    }
}
