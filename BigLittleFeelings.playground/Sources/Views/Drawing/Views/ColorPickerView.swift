//
//  ColorPickerView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct ColorPickerView: View {
    
    @Binding var selected: Color
    
    private var colors: [Color] {
        [Style.Color.black, .white, .gray, .red, .green, .blue, .orange, .purple]
    }
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Button(action: { self.selected = color }) {
                    RoundedRectangle(cornerRadius: 8)
                }.foregroundColor(color)
                    .frame(
                        width: self.selected == color ? 28 : 26,
                        height: self.selected == color ? 28 : 26,
                        alignment: .center
                    ).overlay(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(self.selected == color ? Color.black : Color.clear, lineWidth: 2)
                ).animation(.easeInOut)
            }
        }
    }
    
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(selected: .constant(Style.Color.black))
    }
}
