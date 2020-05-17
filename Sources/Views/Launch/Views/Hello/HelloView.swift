//
//  HelloView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 15/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct HelloView: View {
    
    @ObservedObject var viewModel: HelloViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            header
            input
            footer
        }.background(Style.Color.background)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(radius: 24)
    }
    
    init(viewModel: HelloViewModel) {
        self.viewModel = viewModel
    }
    
}

// MARK: - Subviews
extension HelloView {
    private var header: some View {
        VStack {
            Text(viewModel.title)
                .font(Style.Font.chalk(size: 32))
                .bold()
                .foregroundColor(.white)
                .fillHorizontally()
            Text(viewModel.subtitle)
                .font(Style.Font.font(size: 16))
                .bold()
                .foregroundColor(.white)
                .fillHorizontally()
        }
        .padding([.top, .bottom], 6)
        .contentShape(Rectangle())
        .background(Style.Color.black)
    }
    private var input: some View {
        TextField(viewModel.placeholder, text: $viewModel.name)
            .font(Style.Font.chalk(style: .largeTitle))
            .scaledToFit()
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .multilineTextAlignment(.center)
            .frame(minHeight: 120)
            .padding([.leading, .trailing], 12)
    }
    private var footer: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Style.Color.black)
                .fillHorizontally()
                .frame(height: 32)
            Text(viewModel.footer)
                .font(Style.Font.font(size: 12))
                .foregroundColor(.white)
                .bold()
                .multilineTextAlignment(.leading)
                .fillHorizontally()
        }
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView(viewModel: HelloViewModel())
            .frame(width: 400, alignment: .center)
    }
}
