//
//  ViewModifiers.swift
//  Emotions
//
//  Created by Witek Bobrowski on 14/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

extension View {
    // MARK: - Frame
    func frame(size: CGSize? = nil, alignment: Alignment = .center) -> some View {
        frame(width: size?.width, height: size?.height, alignment: alignment)
    }
    
    // MARK: - Fill
    func fillVertically() -> some View {
        frame(minHeight: 0, maxHeight: .infinity)
    }
    func fillHorizontally() -> some View {
        frame(minWidth: 0, maxWidth: .infinity)
    }
    func fill() -> some View {
        frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
    
}
