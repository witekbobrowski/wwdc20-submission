//
//  HeaderView.swift
//  Emotions
//
//  Created by Witek Bobrowski on 10/05/2020.
//  Copyright © 2020 Witek Bobrowski. All rights reserved.
//

import SwiftUI

struct HeaderView: View  {
    
    @State var title: String
    @EnvironmentObject var router: Router
    @EnvironmentObject var store: Store
    
    var body: some View {
        ZStack {
            HStack {
                if router.current == .dashboard() { profile }
                Spacer()
                if router.current != .dashboard() { close }
            }
            text
        }.fillHorizontally()
    }
    
}

// MARK: - Subviews
extension HeaderView {
    private var text: some View {
        Text(title)
            .font(Style.Font.font(size: 44))
            .foregroundColor(Style.Color.black)
            .kerning(0.5)
            .multilineTextAlignment(.center)
    }
    private var profile: some View {
        Button(action: { self.router.current = .profile }) {
            Group {
                if store.user.avatar == nil {
                    placeholder
                } else {
                    avatar
                }
            }
                .clipShape(Circle())
                .shadow(color: Style.Color.lightGray, radius: 4)
        }.frame(width: 64, height: 64, alignment: .center)
    }
    private var close: some View {
        Button(action: { self.router.current = .dashboard() }) {
            Image(systemName: "xmark")
                .resizable()
                .foregroundColor(Style.Color.black)
                .frame(width: 24, height: 24, alignment: .center)
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
        Image(uiImage: store.user.avatar!)
            .resizable()
            .foregroundColor(.white)
            .padding(.all, 6)
            .background(Style.Color.lightGray)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let store: Store = .mock
        return HeaderView(title: "Hello, \(store.user.name)!")
            .environmentObject(Router(initial: .dashboard()))
            .environmentObject(store)
            .padding(.all, 24)
    }
}
