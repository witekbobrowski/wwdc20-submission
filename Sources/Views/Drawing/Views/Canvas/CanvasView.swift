//
//  CanvasView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct Drawing {
    var strokes = [Stroke]()
}

struct Stroke: Hashable {
    var color: Color
    var points = [CGPoint]()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(color)
        hasher.combine(points)
    }
}

struct CanvasView: View {
    
    @State private var current: Stroke?
    @Binding var drawing: Drawing
    @Binding var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                ZStack {
                    ForEach(self.drawing.strokes, id: \.self) { stroke in
                        Path { path in
                            self.add(stroke, to: &path)
                        }.stroke(stroke.color, lineWidth: 4)
                    }
                    self.current.map { stroke in
                        Path { path in
                            self.add(stroke, to: &path)
                        }.stroke(stroke.color, lineWidth: 4)
                    }
                }.fill()
            }
            .background(Color.white)
            .gesture(
                DragGesture(minimumDistance: 0.1)
                    .onChanged({ (value) in
                        if self.current == nil {
                            self.current = Stroke(color: self.color)
                        }
                        let currentPoint = value.location
                        if currentPoint.y >= 0
                            && currentPoint.y < geometry.size.height {
                            self.current?.points.append(currentPoint)
                        }
                    })
                    .onEnded({ (value) in
                        self.current.map { self.drawing.strokes.append($0) }
                        self.current = nil
                    })
            )
        }.fill()
    }
    
    private func add(_ stroke: Stroke, to path: inout Path) {
        let points = stroke.points
        if points.count > 1 {
            for i in 0..<points.count-1 {
                let current = points[i]
                let next = points[i+1]
                path.move(to: current)
                path.addLine(to: next)
            }
        }
    }
    
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(
            drawing: .constant(Drawing()),
            color: .constant(Style.Color.black)
        )
    }
}

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}
