//
//  PhotoView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct PhotoView: View {
    
    @ObservedObject var viewModel: PhotoViewModel
    
    var body: some View {
        ZStack(alignment: .center) {
            Group {
                if viewModel.avatar == nil { placeholder } else { avatar }
            }.clipShape(Circle())
            GeometryReader { geometry in
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        ZStack {
                            self.camera
                        }
                            .frame(width: geometry.size.width/4, height: geometry.size.height/4)
                            .hoverEffect(.lift)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 8)
                    }
                }.fill()
            }
        }.aspectRatio(1, contentMode: .fit)
    }

}

// MARK: - Subviews
extension PhotoView {
    private var placeholder: some View {
        Image(systemName: viewModel.placeholder)
            .resizable()
            .foregroundColor(.white)
            .padding(.all, 48)
            .background(Style.Color.black)
            .clipShape(Circle())
            .shadow(color: Style.Color.lightGray, radius: 24)
    }
    private var avatar: some View {
        Group {
            viewModel.avatar.map { avatar in
                Text(avatar)
                    .font(.system(size: 64))
                    .shadow(color: Style.Color.lightGray, radius: 24)
                    .fill()
                }.background(Style.Color.lightGray)
            }
        }
    private var camera: some View {
        Button(action: viewModel.tossADice) {
            Text(viewModel.dice)
                .font(.system(size: 20))
                .scaledToFit()
                .foregroundColor(Style.Color.black)
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        let builder = UserBuilder()
        builder.avatar = "👽"
        return PhotoView(viewModel: PhotoViewModel(builder: builder)).frame(width: 150)
    }
}
