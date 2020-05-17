//
//  RotationView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 14/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct RotationView: View {
    
    var viewModel: RotationViewModel
    @Binding var rotation: Angle
    
    var body: some View {
        HStack(spacing: 8) {
            button(
                action: { self.rotation = self.viewModel.left(self.rotation) },
                asset: viewModel.leftSymbol
            )
            button(
                action: { self.rotation = self.viewModel.right(self.rotation) },
                asset: viewModel.rightSymbol
            )
        }
    }
    
    private func button(action: @escaping () -> Void, asset: String) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: asset)
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
            }
            .padding(.all, 6)
            .overlay(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(lineWidth: 2)
            )
        }.foregroundColor(Color(white: 0.2))
    }
}

struct RotationView_Previews: PreviewProvider {
    static var previews: some View {
        RotationView(
            viewModel: RotationViewModel(), rotation: .constant(.zero)
        )
    }
}
