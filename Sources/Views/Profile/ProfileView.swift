//
//  ProfileView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 17/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HeaderView(title: "Your Profile")
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    profile
                }.padding(.top, 24)
            }
            Spacer()
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }

}

// MARK: - Subviews
extension ProfileView {
    private var profile: some View {
        VStack {
            Group {
                if viewModel.avatar == nil { placeholder } else { avatar }
            }
                .clipShape(Circle())
                .shadow(color: Style.Color.lightGray, radius: 4)
                .frame(width: 128, height: 128, alignment: .center)
            Text(viewModel.name)
                .font(Style.Font.chalk(size: 44))
                .foregroundColor(Style.Color.black)
                .kerning(0.5)
                .multilineTextAlignment(.center)
        }
    }
    private var placeholder: some View {
        Image(systemName: "person.fill")
            .resizable()
            .foregroundColor(.white)
            .padding(.all, 16)
            .background(Style.Color.black)
    }
    private var avatar: some View {
        Image(uiImage: viewModel.avatar!)
            .resizable()
            .foregroundColor(.white)
            .padding(.all, 12)
            .background(Style.Color.lightGray)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(store: .mock))
            .environmentObject(Router())
    }
}
