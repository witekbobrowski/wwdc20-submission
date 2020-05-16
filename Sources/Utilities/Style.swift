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
        static let background = SwiftUI.Color(white: 0.98)
        
        static let black = SwiftUI.Color(white: 0.2)
        static let lightGray = SwiftUI.Color(white: 0.9)
        
        static let purple = SwiftUI.Color(red: 230/255, green: 207/255, blue: 230/255)
        static let green = SwiftUI.Color(red: 162/255, green: 195/255, blue: 182/255)
        static let red = SwiftUI.Color(red: 239/255, green: 185/255, blue: 164/255)
        static let blue = SwiftUI.Color(red: 75/255, green: 76/255, blue: 164/255)
    }
    enum Font {
        static func font(size: CGFloat) -> SwiftUI.Font {
            SwiftUI.Font.system(size: size, design: .rounded)
        }
        static func font(style: SwiftUI.Font.TextStyle) -> SwiftUI.Font {
            SwiftUI.Font.system(style, design: .rounded)
        }
        static func chalk(size: CGFloat) -> SwiftUI.Font {
            SwiftUI.Font.custom("Chalkduster", size: size)
        }
        static func chalk(style: UIFont.TextStyle) -> SwiftUI.Font {
            SwiftUI.Font.custom(
                "Chalkduster",
                size: UIFont.preferredFont(forTextStyle: style).pointSize
            )
        }
    }
    enum Insets {
        static var base: EdgeInsets {
            EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
        }
    }
}
