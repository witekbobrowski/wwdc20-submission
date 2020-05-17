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
            HeaderView(title: viewModel.title)
            profile.padding(.top, 24).padding(.bottom, 12)
            if !viewModel.history.items.isEmpty {
                historyTitle.padding(.bottom, 12)
            }
            ScrollView(.vertical, showsIndicators: false) {
                HistoryView(viewModel: viewModel.history)
            }
            FooterView()
        }.fill().padding(Style.Insets.base).background(Style.Color.background)
    }

}

// MARK: - Subviews
extension ProfileView {
    private var profile: some View {
        VStack {
            ZStack(alignment: .center) {
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
            .padding(.all, 32)
            .background(Style.Color.black)
    }
    private var avatar: some View {
        viewModel.avatar.map { avatar in
            Text(avatar)
                .font(.system(size: 64))
                .frame(width: 128, height: 128, alignment: .center)
                .background(Style.Color.lightGray)
        }
    }
    private var historyTitle: some View {
        Text(viewModel.historyTitle)
            .font(Style.Font.font(style: .headline))
            .foregroundColor(Style.Color.black)
            .kerning(0.5)
            .multilineTextAlignment(.center)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(store: .mock))
            .environmentObject(Router())
    }
}
