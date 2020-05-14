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
        HStack(spacing: 12) {
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
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20, alignment: .center)
            }
            .padding(.all, 6)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
            .shadow(radius: 4)
        }
    }
}

struct RotationView_Previews: PreviewProvider {
    static var previews: some View {
        RotationView(
            viewModel: RotationViewModel(), rotation: .constant(.zero)
        )
    }
}
