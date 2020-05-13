//
//  Trapezoid.swift
//  Emotions
//
//  Created by Witek Bobrowski on 14/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: insetAmount))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - insetAmount))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        return path
    }
}

struct Trapezoid_Previews: PreviewProvider {
    static var previews: some View {
        Trapezoid(insetAmount: 320)
    }
}
