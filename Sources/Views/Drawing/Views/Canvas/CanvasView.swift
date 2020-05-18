//
//  CanvasView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct CanvasView: View {
    
    @State private var current: Stroke?
    @Binding var strokes: [Stroke]
    @Binding var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                ZStack {
                    Image(uiImage: UIImage(named: "outline.png")!.withRenderingMode(.alwaysTemplate))
                        .resizable()
                        .foregroundColor(Color.black)
                        .padding(.all, 64)
                    ForEach(self.strokes, id: \.self) { stroke in
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
                        let point = value.location
                        if point.y >= 0, point.y < geometry.size.height, point.x >= 0, point.x < geometry.size.width {
                            self.current?.points.append(point)
                        }
                    })
                    .onEnded({ (value) in
                        self.current.map { self.strokes.append($0) }
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
            strokes: .constant([]), color: .constant(Style.Color.black)
        )
    }
}
