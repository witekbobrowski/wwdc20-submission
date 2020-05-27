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
    @State var showsCloseButton: Bool = true

    @EnvironmentObject var router: Router
    @EnvironmentObject var store: Store
    
    var body: some View {
        ZStack {
            HStack {
                if router.current == .dashboard() { profile }
                Spacer()
                if router.current == .dashboard() { knowledge }
                if showsCloseButton { close }
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
            ZStack {
                if store.user.avatar == nil { placeholder } else { avatar }
            }
                .clipShape(Circle())
                .shadow(color: Style.Color.lightGray, radius: 4)
        }
    }
    private var knowledge: some View {
        Button(action: { self.router.current = .knowledge }) {
            Image(systemName: "info.circle")
                .resizable()
                .padding(.all, 13)
                .foregroundColor(Style.Color.black)
                .frame(width: 50, height: 50, alignment: .center)
                .background(Style.Color.lightGray)
                .clipShape(Circle())
                .shadow(color: Style.Color.lightGray, radius: 4)
        }
    }
    private var close: some View {
        Button(action: { self.router.current = .dashboard() }) {
            Image(systemName: "xmark")
                .resizable()
                .padding(.all, 15)
                .foregroundColor(Style.Color.black)
                .frame(width: 50, height: 50, alignment: .center)
                .background(Style.Color.lightGray)
                .clipShape(Circle())
                .shadow(color: Style.Color.lightGray, radius: 4)
        }
    }
    private var placeholder: some View {
        Image(systemName: "person.fill")
            .resizable()
            .foregroundColor(Style.Color.black)
            .padding(.all, 15)
            .background(Style.Color.lightGray)
            .frame(width: 50, height: 50, alignment: .center)
    }
    private var avatar: some View {
        store.user.avatar.map { avatar in
            Text(avatar)
                .font(.system(size: 30))
                .frame(width: 50, height: 50, alignment: .center)
                .background(Style.Color.lightGray)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let store: Store = .mock
        return HeaderView(title: "Hello, \(store.user.name)!", showsCloseButton: true)
            .environmentObject(Router(initial: .dashboard()))
            .environmentObject(store)
            .padding(.all, 24)
    }
}
