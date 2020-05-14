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
    
    var body: some View {
        HStack(spacing: 12) {
            button(action: viewModel.left, asset: viewModel.leftSymbol)
            button(action: viewModel.right, asset: viewModel.rightSymbol)
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
        RotationView(viewModel: RotationViewModel(rotation: .init(initialValue: .zero)))
    }
}
