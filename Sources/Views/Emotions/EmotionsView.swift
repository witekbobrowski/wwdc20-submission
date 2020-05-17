//
//  EmotionsView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 12/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct EmotionsView: View {
    
    @EnvironmentObject private var router: Router
    
    var viewModel: EmotionsViewModel
    @State var rotation: Angle = .zero
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: viewModel.title)
            Spacer()
            question
            picker
            Spacer()
            controls
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }

}

// MARK: - Subviews
extension EmotionsView {
    private var question: some View {
        VStack {
            Text(viewModel.question)
                .font(Style.Font.chalk(size: 23))
                .foregroundColor(Style.Color.black)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
                .background(Style.Color.accentColor(for: .emotions))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: Style.Color.lightGray, radius: 2)
                .padding(.bottom, 16)
            Text(viewModel.disclosure)
                .font(Style.Font.font(size: 16))
                .foregroundColor(Style.Color.black)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
        }
    }
    private var picker: some View {
        EmotionsPickerView(viewModel: viewModel.pickerViewModel)
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(rotation, anchor: .center)
            .animation(.easeInOut)
            .padding([.leading, .trailing], 64)
    }
    private var controls: some View {
        ZStack {
            HStack {
                RotationView(
                    viewModel: viewModel.rotationViewModel, rotation: $rotation
                )
                Spacer()
            }
            Button(action: {
                self.viewModel.save()
                self.router.current = .dashboard()
            }) {
                Text(Strings.save)
                    .font(Style.Font.font(style: .headline))
                    .foregroundColor(.white)
                    .bold()
                    .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
                    .background(Style.Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
        }.padding(.all, 12)
    }
}


struct EmotionsView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionsView(viewModel: EmotionsViewModel(store: Store()))
            .environmentObject(Router())
    }
}
