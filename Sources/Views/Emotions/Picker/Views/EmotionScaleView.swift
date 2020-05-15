//
//  EmotionScaleView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 13/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct EmotionScaleView: View {

    private let titleWidth: CGFloat = 48
    private let spacing: CGFloat = 4
    @State private var hoveringOver: Int?
    @State private var selected: Int?
    
    var viewModel: EmotionScaleViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .trailing) {
                HStack {
                    Group {
                        Button(action: {}) {
                            Text(self.viewModel.title)
                                .font(Style.Font.font(size: 22))
                                .foregroundColor(Color(white: 0.2))
                                .bold()
                                .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .stroke(lineWidth: 2)
                                        .foregroundColor(Color(white: 0.2))
                                )
                        }
                            .rotationEffect(.degrees(-90), anchor: .center)
                            .frame(width: 256)
                    }.frame(width: self.titleWidth)
                    Spacer()
                }
                GeometryReader { geometry in
                    HStack(alignment: .center, spacing: self.spacing) {
                        ForEach(self.viewModel.scale) { index in
                            self.button(for: index, in: geometry)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    }.padding([.leading, .trailing], self.spacing / 2)
                }
                .frame(size: self.boundingBox(geometry.size))
            }
        }
    }
    
    private func button(for index: Int, in geometry: GeometryProxy) -> some View {
        Button(action: { self.selected = self.selected == index ? nil : index }) {
            trapezoid(for: index, in: geometry)
                .foregroundColor(self.color(for: index))
        }.onHover { isWithinTheFrame in
            self.hoveringOver = isWithinTheFrame ? index : nil
        }
    }
    
    private func trapezoid(for index: Int, in geometry: GeometryProxy) -> some View {
        let count = CGFloat(viewModel.scale.count)
        let size = geometry.size
        let fullwidth = size.width
        let index = CGFloat(index)
        
        // width calculations
        let width = ((fullwidth - spacing) / count) - spacing
        let widthLeft = fullwidth - (width * index) - (spacing * index) - spacing

        // height calculations
        let height = size.height - (index * (size.height / count))
        let adjustedHeight = (((height / 2) / (widthLeft + spacing / 2)) * widthLeft)  * 2
        
        // trapezoid inset
        let inset = -(((adjustedHeight / 2) / widthLeft) * (widthLeft - width) - (adjustedHeight / 2))
        
        return Trapezoid(insetAmount: inset)
            .frame(width: width, height: adjustedHeight)
            .cornerRadius(4)
    }
    
    private func boundingBox(_ size: CGSize) -> CGSize {
        let width = size.width - titleWidth
        let height = (((size.height / 2) / size.width) * width) * 2
        return CGSize(width: width, height: height)
    }
    
    private func color(for index: Int) -> Color {
        if let current = hoveringOver, index >= current {
            return Color(white: 0.2)
        }
        if let selected = selected, index >= selected {
            return Color(white: 0.2)
        }
        return Color(white: 0.9)
    }
    
}

struct EmotionScaleView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionScaleView(viewModel: EmotionScaleViewModel(emotion: .anger))
            .background(Color.yellow)
            .frame(width: 360, height: 180)
    }
}
