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
    @State private var details: EmotionDetailsViewModel?
    
    @ObservedObject var viewModel: EmotionScaleViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .trailing) {
                HStack {
                    Group {
                        Button(action: { self.details = self.viewModel.details }) {
                            Text(self.viewModel.title)
                                .font(Style.Font.font(size: 18))
                                .foregroundColor(Color(white: 0.2))
                                .bold()
                                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                        }
                            .rotationEffect(.degrees(-90), anchor: .center)
                            .frame(width: geometry.size.height + 32)
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
        }.sheet(item: self.$details) { _ in
            EmotionDetailsView(viewModel: self.$details)
        }
    }
    
    private func button(for index: Int, in geometry: GeometryProxy) -> some View {
        Button(action: { self.viewModel.selected = index }) {
            trapezoid(for: index, in: geometry)
                .foregroundColor(self.color(for: index))
        }
        // not available on Swift Playgrounds
//        .onHover { isWithinTheFrame in
//            self.hoveringOver = isWithinTheFrame ? index : nil
//        }
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
        if let current = hoveringOver {
            return index >= current ? highlight(for: index) : Style.Color.lightGray
        }
        if let selected = viewModel.selected, index >= selected {
            return highlight(for: index)
        } else { return Style.Color.lightGray }
    }
    
    private func highlight(for index: Int) -> Color {
        switch index {
        case 0: return Color(red: 255/255, green: 0/255, blue: 121/255)
        case 1: return Color(red: 255/255, green: 0/255, blue: 58/255)
        case 2: return Color(red: 255/255, green: 81/255, blue: 0/255)
        case 3: return Color(red: 255/255, green: 132/255, blue: 0/255)
        case 4: return Color(red: 255/255, green: 180/255, blue: 0/255)
        default: return Style.Color.lightGray
        }
    }
    
}

struct EmotionScaleView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionScaleView(viewModel: EmotionScaleViewModel(emotion: .anger))
            .background(Color.yellow)
            .frame(width: 360, height: 180)
    }
}
