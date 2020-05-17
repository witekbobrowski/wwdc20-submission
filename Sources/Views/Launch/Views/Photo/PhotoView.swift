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
            if viewModel.image == nil { placeholder } else { avatar }
            GeometryReader { geometry in
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        self.camera
                            .padding(.all, 12)
                            .frame(width: geometry.size.width/4.20, height: geometry.size.height/4)
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
            .padding(.all, 64)
            .background(Style.Color.black)
            .clipShape(Circle())
            .shadow(color: Style.Color.lightGray, radius: 24)
    }
    private var avatar: some View {
        Group {
            viewModel.image.map { image in
                Image(uiImage: image)
                    .resizable()
                    .background(Style.Color.lightGray)
                    .clipShape(Circle())
                    .shadow(color: Style.Color.lightGray, radius: 24)
                }
            }
        }
    private var camera: some View {
        Button(action: {}) {
            Image(systemName: viewModel.camera)
                .resizable()
                .scaledToFit()
                .foregroundColor(Style.Color.black)
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(viewModel: PhotoViewModel()).frame(width: 200)
    }
}
