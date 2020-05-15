//
//  PhotoView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 16/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct PhotoView: View {
    
    private var placeholder: some View {
        Image(systemName: "person.fill")
            .resizable()
            .foregroundColor(.white)
    }
    
    private var camera: some View {
        Button(action: {}) {
            Image(systemName: "camera.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Style.Color.black)
        }
    }
    
    var body: some View {
        ZStack {
            placeholder
                .padding(.all, 64)
                .background(Style.Color.black)
                .clipShape(Circle())
                .shadow(radius: 24)
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

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView().frame(width: 200)
    }
}
